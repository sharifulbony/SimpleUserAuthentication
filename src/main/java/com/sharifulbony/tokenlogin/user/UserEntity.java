package com.sharifulbony.tokenlogin.user;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Table(name = "user")
public class UserEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	@Column(unique = true)
	private String email;
	@Column
	private String password;
	@Column
	private String firstName;
	@Column
	private String lastName;

	@Column(unique = true)
	private String personalCode;
	@Column
	private Date birthDate;


}