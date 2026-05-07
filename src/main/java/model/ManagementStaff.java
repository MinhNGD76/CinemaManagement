package model;

public class ManagementStaff extends Staff {
    
    public ManagementStaff() {
        super();
    }

    public ManagementStaff(int id, String username, String password, String fullname, String email, String phoneNum, String description, Name name, String position) {
        super(id, username, password, fullname, email, phoneNum, description, name, position);
    }
}