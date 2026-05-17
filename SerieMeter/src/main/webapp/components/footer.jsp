<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Navbar</title>
<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet" />

<link rel="stylesheet" href="assets/css/style.css" />
</head>

<style>

@media ( max-width : 992px) {
	
	footer {
		padding: 40px 24px 24px !important;
		background-color: #0D0D0D !important;
		display: block !important;
	}

	.sm_footer {
		display: flex !important;
		flex-direction: column !important;
		align-items: center !important;
		text-align: center !important;
		gap: 32px !important;
		background-color: #0D0D0D !important;
		margin: 0 !important;
		padding: 0 !important;
	}
	.sm_footer__brand {
		max-width: 450px !important;
		display: flex !important;
		flex-direction: column !important;
		align-items: center !important;
	}
	.sm_footer__logo {
		margin-bottom: 16px !important;
	}
	.sm_footer__col {
		width: 100% !important;
		max-width: 280px !important;
		margin: 0 !important;
	}
	.sm_footer__col ul {
		list-style: none !important;
		padding: 0 !important;
		margin: 0 !important;
	}
	.sm_footer__col li {
		margin-bottom: 14px !important;
	}

	.sm_footer__bottom {
		display: flex !important;
		flex-direction: column !important;
		gap: 8px !important;
		align-items: center !important;
		margin-top: 32px !important;
		padding: 24px 0 0 0 !important;
		background-color: #0D0D0D !important;
		border-top: 1px solid rgba(255, 255, 255, 0.1) !important;
		width: 100% !important;
	}
}

@media ( max-width : 576px) {
	footer {
		padding: 40px 16px 24px !important;
	}
	.sm_footer__brand p {
		font-size: 13px !important;
		line-height: 1.6 !important;
		color: #aaaaaa !important;
	}
	.sm_footer__col h4 {
		font-size: 14px !important;
		margin-bottom: 12px !important;
	}
	.sm_footer__bottom {
		font-size: 11px !important;
		color: #666666 !important;
	}
}
</style>

<body>

	<!-- Footer -->
	<footer>
		<div class="sm_footer">
			<div class="sm_footer__brand">
				<div class="sm_footer__logo">
					<img src="assets/images/LogoBlack.jpg" alt="SerieMeter" />
				</div>
				<p>Elevating cinematic conversation through expert ratings and
					curated insights. Your premium guide to the silver screen.</p>
			</div>

			<div class="sm_footer__col">
				<h4>Explore</h4>
				<ul>
					<li><a href="${pageContext.request.contextPath}/Movies">Movies</a></li>
					<li><a href="${pageContext.request.contextPath}/Series">Series</a></li>
					<li><a href="${pageContext.request.contextPath}/Search">Global
							Search</a></li>
					<li><a href="${pageContext.request.contextPath}/Contact">Contact
							Us</a></li>
				</ul>
			</div>

			<div class="sm_footer__col">
				<h4>Dev</h4>
				<ul>
					<li><a href="https://github.com/Shirbhooshan/SerieMeter">Documentation</a></li>
				</ul>
			</div>
		</div>

		<div class="sm_footer__bottom">
			<span>© 2026 SerieMeter. All rights Reserved.</span> <span>ENGLISH
				(US)</span>
		</div>
	</footer>


</body>
</html>