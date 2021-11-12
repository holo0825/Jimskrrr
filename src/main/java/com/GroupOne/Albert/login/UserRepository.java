package com.GroupOne.Albert.login;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.GroupOne.Albert.members.Member;
// 建立Spring Data JPA提供的CrudRepository的子介面，Spring會在runtime的時候自動產生此介面的implementation class。
public interface UserRepository extends CrudRepository<Member, Integer> {
//public interface UserRepository extends CrudRepository<User, Long> {
	
	// 自定義getUserByUsername()方法，使用@Query註釋告訴Spring Security要用來做驗證
//	@Query("SELECT u FROM User u WHERE u.username = :username")
//	public User getUserByUsername(@Param("username") String username);
	@Query("SELECT m FROM Member m WHERE m.username = :username")
	public Member getMemberByUsername(@Param("username") String username);
}
