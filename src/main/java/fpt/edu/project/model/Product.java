package fpt.edu.project.model;
// Generated Oct 26, 2020 1:06:17 PM by Hibernate Tools 4.3.1

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
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

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * Product generated by hbm2java
 */
@Entity
@Table(name = "Product", schema = "dbo", catalog = "YourAnswer")
public class Product implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String productId;
	private Category category;
	private String productName;
	private Date updateDate;
	private int quantity;
	private double price;
	private String thumbnail;
	private String description;
	private Boolean visibility;
	private Set<CartDetail> cartDetails = new HashSet<CartDetail>(0);
	private Set<Image> images = new HashSet<Image>(0);
	private Set<Rating> ratings = new HashSet<Rating>(0);
	private Set<WishList> wishLists = new HashSet<WishList>(0);

	public Product() {
	}

	public Product(String productId) {
		this.productId = productId;
	}

	public Product(String productId, Category category, String productName, Date date, int quantity, double price,
			String description, String thumbnail, boolean visibility) {
		this.productId = productId;
		this.category = category;
		this.productName = productName;
		this.updateDate = date;
		this.quantity = quantity;
		this.price = price;
		this.description = description;
		this.thumbnail = thumbnail;
		this.visibility = visibility;
	}

	public Product(String productId, Category category, String productName, Date updateDate, int quantity, double price,
			String thumbnail, String description, Boolean visibility, Set<CartDetail> cartDetails, Set<Image> images,
			Set<Rating> ratings, Set<WishList> wishLists) {
		this.productId = productId;
		this.category = category;
		this.productName = productName;
		this.updateDate = updateDate;
		this.quantity = quantity;
		this.price = price;
		this.thumbnail = thumbnail;
		this.description = description;
		this.visibility = visibility;
		this.cartDetails = cartDetails;
		this.images = images;
		this.ratings = ratings;
		this.wishLists = wishLists;
	}

	@Id
	@Column(name = "productId", unique = true, nullable = false)
	public String getProductId() {
		return this.productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "categoryId", nullable = false)
	@JsonIgnore
	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@Column(name = "productName", nullable = false)
	public String getProductName() {
		return this.productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "updateDate", length = 23)
	public Date getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	@Column(name = "quantity", nullable = false)
	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Column(name = "price", nullable = false, precision = 53, scale = 0)
	public double getPrice() {
		return this.price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	@Column(name = "thumbnail", nullable = false)
	public String getThumbnail() {
		return this.thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	@Column(name = "description")
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "visibility")
	public Boolean getVisibility() {
		return this.visibility;
	}

	public void setVisibility(Boolean visibility) {
		this.visibility = visibility;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
	public Set<CartDetail> getCartDetails() {
		return this.cartDetails;
	}

	public void setCartDetails(Set<CartDetail> cartDetails) {
		this.cartDetails = cartDetails;
	}

	@OneToMany(cascade=CascadeType.ALL, mappedBy = "product")
	public Set<Image> getImages() {
		return this.images;
	}

	public void setImages(Set<Image> images) {
		this.images = images;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
	public Set<Rating> getRatings() {
		return this.ratings;
	}

	public void setRatings(Set<Rating> ratings) {
		this.ratings = ratings;
	}

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "product")
	public Set<WishList> getWishLists() {
		return this.wishLists;
	}

	public void setWishLists(Set<WishList> wishLists) {
		this.wishLists = wishLists;
	}

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", category=" + category + ", productName=" + productName
				+ ", updateDate=" + updateDate + ", quantity=" + quantity + ", price=" + price + ", thumbnail="
				+ thumbnail + ", description=" + description + ", visibility=" + visibility + ", cartDetails="
				+ cartDetails + ", images=" + images + ", ratings=" + ratings + ", wishLists=" + wishLists + "]";
	}

	@Override
	public int hashCode() {
		return productId.hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		return ((Product) obj).hashCode() == (this.hashCode());
	}

}
