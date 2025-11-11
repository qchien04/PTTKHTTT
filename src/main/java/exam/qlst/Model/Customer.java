package exam.qlst.Model;


import java.util.Date;

public class Customer {
    private int id;
    private String username;
    private String password;
    private String fullName;
    private Date dob;
    private String phoneNumber;
    private String address;
    private String email;
    private boolean isMember;

    // Constructor mặc định
    public Customer() {
        this.isMember = false;
    }

    // Constructor đầy đủ
    public Customer(int id, String username, String password, String fullName,
                    Date dob, String phoneNumber, String email, boolean isMember) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.fullName = fullName;
        this.dob = dob;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.isMember = isMember;
    }

    // Getters
    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getFullName() {
        return fullName;
    }

    public Date getDob() {
        return dob;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public boolean isMember() {
        return isMember;
    }

    // Setters
    public void setId(int id) {
        this.id = id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setMember(boolean isMember) {
        this.isMember = isMember;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", fullName='" + fullName + '\'' +
                ", email='" + email + '\'' +
                ", isMember=" + isMember +
                '}';
    }
}
