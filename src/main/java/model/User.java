package model;

public class User {
    private int id;
    private String username;
    private String password;
    private String fullname;
    private String email;
    private String phoneNum;
    private String description;
    private Name name;

    public User() {}

    public User(int id, String username, String password, String fullname, String email, String phoneNum, String description, Name name) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.fullname = fullname;
        this.email = email;
        this.phoneNum = phoneNum;
        this.description = description;
        this.name = name;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    
    public String getFullname() { return fullname; }
    public void setFullname(String fullname) { this.fullname = fullname; }
    
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    
    public String getPhoneNum() { return phoneNum; }
    public void setPhoneNum(String phoneNum) { this.phoneNum = phoneNum; }
    
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    
    public Name getName() { return name; }
    public void setName(Name name) { this.name = name; }
}
