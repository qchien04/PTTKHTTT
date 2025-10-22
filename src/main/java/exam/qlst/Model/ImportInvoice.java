package exam.qlst.Model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ImportInvoice {
    private int id;
    private Date importDate;
    private double total;
    private Supplier supplier;
    private Staff warehouseStaff;
    private List<ImportItem> importItems;

    public ImportInvoice() {
        importItems = new ArrayList<>();
    }

    public ImportInvoice(Date  importDate, Supplier supplier, Staff warehouseStaff) {
        importItems = new ArrayList<>();
        this.importDate = importDate;
        this.supplier = supplier;
        this.warehouseStaff = warehouseStaff;
    }

    public ImportInvoice(int id, Date importDate, double total, Supplier supplier,
                         Staff warehouseStaff, List<ImportItem> importItems) {
        this.id = id;
        this.importDate = importDate;
        this.total = total;
        this.supplier = supplier;
        this.warehouseStaff = warehouseStaff;
        this.importItems = importItems;
    }

    public void addImportItem(ImportItem importItem) {
        this.importItems.add(importItem);
    }

    public void calTotal(){
        total = 0;
        for (ImportItem importItem : importItems) {
            total += importItem.getPrice();
        }
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public Date getImportDate() { return importDate; }
    public void setImportDate(Date importDate) { this.importDate = importDate; }
    public double getTotal() { return total; }
    public void setTotal(double total) { this.total = total; }
    public Supplier getSupplier() { return supplier; }
    public void setSupplier(Supplier supplier) { this.supplier = supplier; }
    public Staff getWarehouseStaff() { return warehouseStaff; }
    public void setWarehouseStaff(Staff warehouseStaff) { this.warehouseStaff = warehouseStaff; }
    public List<ImportItem> getImportItems() { return importItems; }
    public void setImportItems(List<ImportItem> importItems) { this.importItems = importItems; }

    @Override
    public String toString() {
        return "ImportInvoice{" +
                "id=" + id +
                ", importDate=" + importDate +
                ", total=" + total +
                ", supplier=" + supplier +
                ", warehouseStaff=" + warehouseStaff +
                ", importItems=" + importItems +
                '}';
    }
}
