package fpt.edu.project.model;
// Generated Oct 26, 2020 1:06:17 PM by Hibernate Tools 4.3.1

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * WishList generated by hbm2java
 */
@Entity
@Table(name = "WishList", schema = "dbo", catalog = "YourAnswer")
public class WishList implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int wishListId;
	private Account account;
	private Product product;

	public WishList() {
	}

	public WishList(int wishListId, Account account, Product product) {
		this.wishListId = wishListId;
		this.account = account;
		this.product = product;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "wishListId", unique = true, nullable = false)
	public int getWishListId() {
		return this.wishListId;
	}

	public void setWishListId(int wishListId) {
		this.wishListId = wishListId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userId", nullable = false)
	public Account getAccount() {
		return this.account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "productId", nullable = false)
	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

}
