package model;

public class Name {
    private int id;
    private String middlename;
    private String lastname;
    private String surname;

    public Name() {}

    public Name(int id, String middlename, String lastname, String surname) {
        this.id = id;
        this.middlename = middlename;
        this.lastname = lastname;
        this.surname = surname;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public String getMiddlename() { return middlename; }
    public void setMiddlename(String middlename) { this.middlename = middlename; }
    
    public String getLastname() { return lastname; }
    public void setLastname(String lastname) { this.lastname = lastname; }
    
    public String getSurname() { return surname; }
    public void setSurname(String surname) { this.surname = surname; }
}
