package buysell_tailorsoft.beans;

public class UsersLogin {
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	String id,pass,status,type;
	
public UsersLogin() {
		
	}

public UsersLogin(String id, String pass, String status, String type) {
	super();
	this.id = id;
	this.pass = pass;
	this.status = status;
	this.type = type;
}




}
