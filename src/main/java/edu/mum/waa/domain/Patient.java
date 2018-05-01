package edu.mum.waa.domain;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Transient;
import javax.validation.Valid;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import edu.mum.waa.validator.EmailExist;
import edu.mum.waa.validator.PasswordMatchContraintValidator;

@Entity(name = "patient")
@PasswordMatchContraintValidator
public class Patient {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private long id;

	@NotEmpty(message = "{field.not.empty}")
	@Column(name = "first_name")
	private String firstName;

	@NotEmpty(message = "{field.not.empty}")
	@Column(name = "last_name")
	private String lastName;

	@DateTimeFormat(pattern = "MM-dd-yyyy")
	@Past(message = "{not.valid.date}")
	@Column(name = "birth_date")
	private Date birthDate;

	@Email(message = "{email.not.valid}")
	@NotEmpty(message = "{field.not.empty}")
	@EmailExist
	@Column(name = "email")
	private String email;

	@Column(name = "remarks")
	private String remarks;

	@Transient
	private String confirmedPassword;

	@Column(name = "phone")
	private String phone;

	@OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "address_id")
	@Valid
	Address address;
	
	@OneToMany(mappedBy = "patient")
	private List<Prescription> prescriptions;
	
	@OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "user_id")
	@Valid
	User user;
	
	@Transient
	@NotNull
	private MultipartFile photo;

	public long getId() {
		return id;
	}

	public MultipartFile getPhoto() {
		return photo;
	}

	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}

	public void setId(long id) {
		this.id = id;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getConfirmedPassword() {
		return confirmedPassword;
	}

	public void setConfirmedPassword(String confirmedPassword) {
		this.confirmedPassword = confirmedPassword;
	}
}
