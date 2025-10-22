package exam.qlst.Model;

public class ImportItem {
    private int id;
    private int quantity;
    private double price;
    private String note;
    private Item item;

    public ImportItem() {}

    public ImportItem(int quantity, double price, String note, Item item) {
        this.item = item;
        this.quantity = quantity;
        this.price = price;
        this.note = note;
    }

    public ImportItem(int id, int quantity, double price, String note, Item item) {
        this.id = id;
        this.quantity = quantity;
        this.price = price;
        this.note = note;
        this.item = item;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
    public String getNote() { return note; }
    public void setNote(String note) { this.note = note; }
    public Item getItem() { return item; }
    public void setItem(Item item) { this.item = item; }

    @Override
    public String toString() {
        return "ImportItem{" +
                "id=" + id +
                ", quantity=" + quantity +
                ", price=" + price +
                ", note='" + note + '\'' +
                ", item=" + item +
                '}';
    }
}