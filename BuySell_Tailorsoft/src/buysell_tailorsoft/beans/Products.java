package buysell_tailorsoft.beans;
import java.sql.Date;
public class Products {

	public String getProducttitle() {
		return Producttitle;
	}


	public void setProducttitle(String producttitle) {
		Producttitle = producttitle;
	}


	public String getHowolditis() {
		return Howolditis;
	}


	public void setHowolditis(String howolditis) {
		Howolditis = howolditis;
	}


	public String getMrpofproduct() {
		return Mrpofproduct;
	}


	public void setMrpofproduct(String mrpofproduct) {
		Mrpofproduct = mrpofproduct;
	}


	public String getProductdescription() {
		return Productdescription;
	}


	public void setProductdescription(String productdescription) {
		Productdescription = productdescription;
	}


	public String getSellingpriceofproduct() {
		return Sellingpriceofproduct;
	}


	public void setSellingpriceofproduct(String sellingpriceofproduct) {
		Sellingpriceofproduct = sellingpriceofproduct;
	}


	public Date getDate() {
		return date;
	}


	public void setDate(Date date) {
		this.date = date;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getProductid() {
		return Productid;
	}


	public void setProductid(String productid) {
		Productid = productid;
	}


	public Products(String producttitle, String howolditis, String mrpofproduct, String productdescription,
			String sellingpriceofproduct, Date dt, String city) {
		super();
		Producttitle = producttitle;
		Howolditis = howolditis;
		Mrpofproduct = mrpofproduct;
		Productdescription = productdescription;
		Sellingpriceofproduct = sellingpriceofproduct;
		this.city =city;
		this.date = dt;
	}


	private String Producttitle,Howolditis,Mrpofproduct,Productdescription,Sellingpriceofproduct,city;
	private	Date date;
	private String Productid;
	

	public Products() {
		
	}


	public void setPicname(String picsrc) {
		// TODO Auto-generated method stub
		
	}

	

}
