<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="col-md-10 col-md-offset-1">
	<sf:form class="form-horizontal"
		action="${pageContext.request.contextPath}/createaccount"
		method="post" commandName="user">
		<fieldset>

			<!-- Form Name -->
			<legend>Create new account</legend>

			<!-- Email input-->
			<div class="control-group">
				<label class="control-label" for="email">Email Address</label>
				<div class="controls">
					<sf:input id="email" path="email" name="email"
						placeholder="Enter Email Address" class="input-xlarge" required=""
						type="text" />
					<sf:errors path="email" cssClass="alert-danger"></sf:errors>

				</div>
			</div>

			<br>

			<!-- Username input-->
			<div class="control-group">
				<label class="control-label" for="username">Username</label>
				<div class="controls">
					<sf:input id="username" path="username" name="username"
						placeholder="Enter Usrename" class="input-xlarge" required=""
						type="text" />
					<sf:errors path="username" cssClass="alert-danger"></sf:errors>
				</div>
			</div>

			<br>

			<!-- Password input-->
			<div class="control-group">
				<label class="control-label" for="password">Password</label>
				<div class="controls">
					<sf:input id="password" path="password" name="password"
						placeholder="Enter Password" class="input-xlarge" required=""
						type="password" />
					<sf:errors path="password" cssClass="alert-danger"></sf:errors>
				</div>
			</div>

			<br>

			<!-- Confirm Password input-->
			<div class="control-group">
				<label class="control-label" for="confirmpassword">Confirm
					password</label>
				<div class="controls">
					<input id="confirmpassword" name="confirmpassword"
						placeholder="Confirm Password" class="input-xlarge" required=""
						type="password" />

				</div>
			</div>

			<br>

			<!-- Button -->
			<div class="control-group">
				<label class="control-label" for="submit"></label>
				<div class="controls">
					<button id="submit" name="submit" class="btn btn-primary">Create
						Account</button>
				</div>
			</div>

		</fieldset>
	</sf:form>

</div>

<script>
	var password1 = document.getElementById('password');
	var password2 = document.getElementById('confirmpassword');

	var checkPasswordValidity = function() {
		if (password1.value != password2.value) {
			password1
					.setCustomValidity("<fmt:message key='UnmatchedPasswords.user.password' />.");
		} else {
			password1.setCustomValidity('');
		}
	};

	password1.addEventListener('change', checkPasswordValidity, false);
	password2.addEventListener('change', checkPasswordValidity, false);

	var form = document.getElementById('user');
	form.addEventListener('submit', function() {
		checkPasswordValidity();
		if (!this.checkValidity()) {
			event.preventDefault();
			//Implement you own means of displaying error messages to the user here.
			password1.focus();
		}
	}, false);
</script>