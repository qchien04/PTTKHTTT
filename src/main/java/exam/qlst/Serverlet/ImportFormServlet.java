package exam.qlst.Serverlet;
import exam.qlst.DAO.ImportInvoiceDAO;
import exam.qlst.Model.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet("/importForm")
public class ImportFormServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String supplierIdParam = request.getParameter("supplierId");
        String selectedItemId = request.getParameter("selectedItem");


        HttpSession session = request.getSession();

        ImportInvoice importInvoice = null;
        ArrayList<Item> selectedItems = null;

        String delItem = request.getParameter("del");
        if(session.getAttribute("selectedItems") != null && delItem != null) {
            int delItemId=Integer.parseInt(delItem);
            ArrayList<Item> items = (ArrayList<Item>) session.getAttribute("selectedItems");
            List<Item> updatedItems = items.stream()
                    .filter(item -> item.getId() != delItemId)
                    .toList();

            session.setAttribute("selectedItems", new ArrayList<>(updatedItems));
        }


        if(session.getAttribute("selectedItems") != null){
            selectedItems = (ArrayList<Item>) session.getAttribute("selectedItems");
        }else{
            Supplier supplier = null;
            if (supplierIdParam != null && !supplierIdParam.isEmpty()) {
                int supplierId = Integer.parseInt(supplierIdParam);
                for(Supplier sup: (List<Supplier>)session.getAttribute("supplierList")){
                    if(sup.getId() == supplierId){
                        supplier = sup;
                        break;
                    }
                }
            }else{
                request.getRequestDispatcher("WarehouseStaffView/SearchSupplierView.jsp").forward(request, response);
            }

            Staff staff = (Staff)  session.getAttribute("staff");

            importInvoice = new ImportInvoice(new Date(), supplier, staff);

            selectedItems = new ArrayList<>();
            session.setAttribute("importInvoice",importInvoice);
            session.setAttribute("selectedItems",selectedItems);
        }


        if (selectedItemId != null && !selectedItemId.isEmpty()) {
            int itemId = Integer.parseInt(selectedItemId);
            for (Item item : (List<Item>)session.getAttribute("itemList")) {
                if(item.getId() == itemId){
                    boolean exists = false;
                    for(Item item2:selectedItems){
                        if(item2.getId() == item.getId()){
                            exists = true;
                        }
                    }
                    if(!exists) {
                        selectedItems.add(item);
                    }
                    break;
                }
            }
        }

        Supplier selectedSupplier = ((ImportInvoice) session.getAttribute("importInvoice")).getSupplier();
        request.setAttribute("selectedSupplier", selectedSupplier);
        request.setAttribute("selectedItems", selectedItems);
        request.setAttribute("staff", (Staff) session.getAttribute("staff"));

        request.getRequestDispatcher("WarehouseStaffView/ImportFormView.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        ImportInvoice invoice = null;
        if(session.getAttribute("importInvoice") != null){
            invoice = (ImportInvoice) session.getAttribute("importInvoice");
        }else{
            request.getRequestDispatcher("WarehouseStaffView/SearchSupplierView.jsp").forward(request, response);
        }

        String[] quantities = request.getParameterValues("quantity[]");
        String[] prices = request.getParameterValues("price[]");
        String[] notes = request.getParameterValues("note[]");

        ArrayList<Item> selectedItems = (ArrayList<Item>)session.getAttribute("selectedItems");

        for (int i=0;i<selectedItems.size();i++) {
            int quantity = Integer.parseInt(quantities[i]);
            double price = Double.parseDouble(prices[i]);
            String note = (notes != null && i < notes.length) ? notes[i] : "";

            ImportItem importItem = new ImportItem(quantity, price, note, selectedItems.get(i));
            invoice.addImportItem(importItem);
        }

        ImportInvoiceDAO invoiceDAO = new ImportInvoiceDAO();
        if (invoiceDAO.saveImportInvoice(invoice)!=null) {
            session.removeAttribute("supplierList");
            session.removeAttribute("itemList");
            session.removeAttribute("importInvoice");
            session.removeAttribute("selectedItems");

            invoice.calTotal();
            request.setAttribute("invoice", invoice);
            request.getRequestDispatcher("WarehouseStaffView/StatusInvoice.jsp").forward(request, response);
        }

    }
}
