<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<section class="page-section">
	<div class="wrap container">
		<div class="row">
			<!--start main contain of page-->
			<div class="col-lg-12 col-md-12 col-sm-8">
				<div class="information-title">Create your account</div>
				<div class="details-wrap">
					<div class="details-box">
						<form class="form-delivery" action="register" method="post">
							<div class="row">
								<div class="col-md-6 col-sm-6">
									<div class="form-group">
										<input required type="text" name="name" placeholder="Name" value="${name}"
											class="form-control">
										<p style="color: red">${errorUniqueName}</p>
									</div>
								</div>
								<div class="col-md-6 col-sm-6">
									<div class="form-group">
										<input required type="password" name="password" placeholder="Password" value="${password}"
											class="form-control">
										<p></p>
									</div>
								</div>
								<div class="col-md-6 col-sm-6">
									<div class="form-group">
										<input required type="text" name="email" placeholder="Email" value="${email}"
											class="form-control">
										<p style="color: red">${errorUniqueEmail}</p>
									</div>
								</div>
								<div class="col-md-6 col-sm-6">
									<div class="form-group">
										<input required type="password" name="confirmPassword" placeholder="Confirm Password" value="${confirmPassword}"
											class="form-control">
										<p style="color: red">${errorConfirmPassword}</p>
									</div>
								</div>
								<div class="col-md-12 col-sm-12">
									<button class="btn btn-theme btn-theme-dark" type="submit">
										Register</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!--end main contain of page-->

		</div>

	</div>
</section>