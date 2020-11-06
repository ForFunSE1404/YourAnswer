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
 * Category generated by hbm2java
 */
@Entity
@Table(name = "Category", schema = "dbo", catalog = "YourAnswer")
public class Category implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String categoryId;
	private String categoryName;
	private Set<Product> products = new HashSet<Product>(0);

	public Category() {
	}

	public Category(String categoryId) {
		this.categoryId = categoryId;
	}

	public Category(String categoryId, String categoryName) {
		this.categoryId = categoryId;
		this.categoryName = categoryName;
	}

	public Category(String categoryId, String categoryName, Set<Product> products) {
		this.categoryId = categoryId;
		this.categoryName = categoryName;
		this.products = products;
	}

	@Id

	@Column(name = "categoryId", unique = true, nullable = false)
	public String getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	@Column(name = "categoryName", nullable = false)
	public String getCategoryName() {
		return this.categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "category")
	public Set<Product> getProducts() {
		return this.products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

}
