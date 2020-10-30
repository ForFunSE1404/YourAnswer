package fpt.edu.project.model;
// Generated Oct 26, 2020 1:06:17 PM by Hibernate Tools 4.3.1

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Cart generated by hbm2java
 */
@Entity
@Table(name = "Cart", schema = "dbo", catalog = "YourAnswer")
public class Cart implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int cartId;
	private Account account;
	private Date createDate;
	private double totalprice;
	private boolean status;
	private String note;
	private Set<CartDetail> cartDetails = new HashSet<CartDetail>(0);

	public Cart() {
	}

	public Cart(int cartId, Account account, Date createDate, double totalprice, boolean status, String note) {
		this.cartId = cartId;
		this.account = account;
		this.createDate = createDate;
		this.totalprice = totalprice;
		this.status = status;
		this.note = note;
	}

	public Cart(int cartId, Account account, Date createDate, double totalprice, boolean status, String note,
			Set<CartDetail> cartDetails) {
		this.cartId = cartId;
		this.account = account;
		this.createDate = createDate;
		this.totalprice = totalprice;
		this.status = status;
		this.note = note;
		this.cartDetails = cartDetails;
	}

	@Id

	@Column(name = "cartId", unique = true, nullable = false)
	public int getCartId() {
		return this.cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userId", nullable = false)
	public Account getAccount() {
		return this.account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "createDate", nullable = false, length = 23)
	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Column(name = "totalprice", nullable = false, precision = 53, scale = 0)
	public double getTotalprice() {
		return this.totalprice;
	}

	public void setTotalprice(double totalprice) {
		this.totalprice = totalprice;
	}

	@Column(name = "status", nullable = false)
	public boolean isStatus() {
		return this.status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@Column(name = "note", nullable = false)
	public String getNote() {
		return this.note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "cart")
	public Set<CartDetail> getCartDetails() {
		return this.cartDetails;
	}

	public void setCartDetails(Set<CartDetail> cartDetails) {
		this.cartDetails = cartDetails;
	}

}
