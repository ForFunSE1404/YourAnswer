package fpt.edu.project.model;
// Generated Oct 26, 2020 1:06:17 PM by Hibernate Tools 4.3.1

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * InfoUser generated by hbm2java
 */
@Entity
@Table(name = "InfoUser", schema = "dbo", catalog = "YourAnswer")
public class InfoUser implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int infoId;
	private String city;
	private String address;
	private String phone;
	private Set<Account> accounts = new HashSet<Account>(0);

	public InfoUser() {
	}

	public InfoUser(int infoId) {
		this.infoId = infoId;
	}

	public InfoUser(int infoId, String city, String address, String phone, Set<Account> accounts) {
		this.infoId = infoId;
		this.city = city;
		this.address = address;
		this.phone = phone;
		this.accounts = accounts;
	}

	@Id

	@Column(name = "infoId", unique = true, nullable = false)
	public int getInfoId() {
		return this.infoId;
	}

	public void setInfoId(int infoId) {
		this.infoId = infoId;
	}

	@Column(name = "city")
	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Column(name = "address")
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "phone")
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "infoUser")
	public Set<Account> getAccounts() {
		return this.accounts;
	}

	public void setAccounts(Set<Account> accounts) {
		this.accounts = accounts;
	}

}
