package model;

public class Staff extends User {
    private String position;

    public Staff() {
        super();
    }

    public Staff(int id, String username, String password, String fullname, String email, String phoneNum, String description, Name name, String position) {
        super(id, username, password, fullname, email, phoneNum, description, name);
        this.position = position;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }
}