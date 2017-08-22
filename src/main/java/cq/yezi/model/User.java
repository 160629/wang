package cq.yezi.model;

/**
 * 用户
 */
public class User extends BaseMo {
    private long userId;
    private String firstName;
    private String lastName;
    private String email;
    private String mobile;
    private String password;
    private String apiTicket;

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getApiTicket() {
        return apiTicket;
    }

    public void setApiTicket(String apiTicket) {
        this.apiTicket = apiTicket;
    }
}
