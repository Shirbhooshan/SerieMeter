<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Seriemeter – Bookmarks</title>
<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap"
	rel="stylesheet" />

<style>
/* ── RESET & BASE ── */
*, *::before, *::after {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

:root {
	--orange: #E8824A;
	--orange-light: #F0A070;
	--black: #0D0D0D;
	--white: #FFFFFF;
	--gray-100: #F5F5F5;
	--gray-200: #E8E8E8;
	--gray-300: #CCCCCC;
	--gray-400: #AAAAAA;
	--gray-600: #666666;
	--text: #1A1A1A;
}

body {
	font-family: 'Manrope', sans-serif;
	color: var(--text);
	background: var(--white);
	min-height: 100vh;
}

a {
	text-decoration: none;
	color: inherit;
}

/* ── PAGE HEADER ── */
.page-header {
	padding: 48px 60px 40px;
	display: flex;
	align-items: flex-start;
	justify-content: space-between;
}

.page-header__label {
	font-size: 11px;
	font-weight: 700;
	letter-spacing: 2px;
	text-transform: uppercase;
	color: var(--gray-400);
	margin-bottom: 10px;
}

.page-header__title {
	font-size: 52px;
	font-weight: 800;
	letter-spacing: -1.5px;
	line-height: 1.05;
	color: var(--black);
	margin-bottom: 14px;
}

.page-header__subtitle {
	font-size: 15px;
	color: var(--gray-600);
	line-height: 1.6;
}

.btn-clear {
	background: var(--black);
	color: var(--white);
	border: none;
	border-radius: 8px;
	padding: 16px 32px;
	font-family: 'Manrope', sans-serif;
	font-size: 14px;
	font-weight: 700;
	letter-spacing: 1px;
	text-transform: uppercase;
	cursor: pointer;
	white-space: nowrap;
	margin-top: 8px;
	transition: background .2s;
}

.btn-clear:hover {
	background: #333;
}

/* ── BOOKMARKS GRID ── */
.bookmarks-grid {
	padding: 0 60px 80px;
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 28px 24px;
}

/* ── BOOKMARK CARD ── */
.bcard {
	cursor: pointer;
}

.bcard__poster {
	position: relative;
	width: 100%;
	aspect-ratio: 2/3;
	border-radius: 12px;
	overflow: hidden;
	background: var(--gray-200);
	margin-bottom: 12px;
}

.bcard__heart {
	position: absolute;
	top: 10px;
	right: 10px;
	width: 32px;
	height: 32px;
	background: var(--white);
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	z-index: 2;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);
}

.bcard__heart svg {
	color: #e53935;
}

.bcard__info {
	display: flex;
	align-items: flex-start;
	justify-content: space-between;
	gap: 8px;
}

.bcard__title {
	font-size: 15px;
	font-weight: 700;
	line-height: 1.3;
	color: var(--black);
}

.bcard__year {
	font-size: 14px;
	font-weight: 500;
	color: var(--gray-400);
	white-space: nowrap;
	margin-top: 1px;
}

.bcard__genre {
	font-size: 11px;
	font-weight: 600;
	letter-spacing: 1px;
	text-transform: uppercase;
	color: var(--gray-400);
	margin-top: 4px;
}
</style>
</head>

<body>

	<%@ include file="/components/navbar.jsp"%>

	<div class="page-header">
		<div class="page-header__left">
			<p class="page-header__label">Personal Archive</p>
			<h1 class="page-header__title">Your Bookmarks</h1>
			<p class="page-header__subtitle">
				A curated collection of your favorite cinematic journeys.<br>
				Ready to be revisited at any moment.
			</p>
		</div>
		<button class="btn-clear">CLEAR ALL</button>
	</div>

	<div class="bookmarks-grid">

		<div class="bcard">
			<div class="bcard__poster">
				<div class="bcard__heart">
					<svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor">
						<path
							d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z" /></svg>
				</div>
			</div>
			<div class="bcard__info">
				<div>
					<div class="bcard__title">Mamma Mia!</div>
					<div class="bcard__genre">Adventure</div>
				</div>
				<div class="bcard__year">2020</div>
			</div>
		</div>

		<div class="bcard">
			<div class="bcard__poster">
				<div class="bcard__heart">
					<svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor">
						<path
							d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z" /></svg>
				</div>
			</div>
			<div class="bcard__info">
				<div>
					<div class="bcard__title">The Good Place</div>
					<div class="bcard__genre">Biography</div>
				</div>
				<div class="bcard__year">2021</div>
			</div>
		</div>

		<div class="bcard">
			<div class="bcard__poster">
				<div class="bcard__heart">
					<svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor">
						<path
							d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z" /></svg>
				</div>
			</div>
			<div class="bcard__info">
				<div>
					<div class="bcard__title">Star Wars</div>
					<div class="bcard__genre">Biography</div>
				</div>
				<div class="bcard__year">2021</div>
			</div>
		</div>

		<div class="bcard">
			<div class="bcard__poster">
				<div class="bcard__heart">
					<svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor">
						<path
							d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z" /></svg>
				</div>
			</div>
			<div class="bcard__info">
				<div>
					<div class="bcard__title">Interstellar</div>
					<div class="bcard__genre">Biography</div>
				</div>
				<div class="bcard__year">2021</div>
			</div>
		</div>

		<div class="bcard">
			<div class="bcard__poster">
				<div class="bcard__heart">
					<svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor">
						<path
							d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z" /></svg>
				</div>
			</div>
			<div class="bcard__info">
				<div>
					<div class="bcard__title">The Trueman Show</div>
					<div class="bcard__genre">Biography</div>
				</div>
				<div class="bcard__year">2021</div>
			</div>
		</div>

		<div class="bcard">
			<div class="bcard__poster">
				<div class="bcard__heart">
					<svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor">
						<path
							d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z" /></svg>
				</div>
			</div>
			<div class="bcard__info">
				<div>
					<div class="bcard__title">Grey's Anatomy</div>
					<div class="bcard__genre">Fantasy</div>
				</div>
				<div class="bcard__year">2022</div>
			</div>
		</div>

		<div class="bcard">
			<div class="bcard__poster">
				<div class="bcard__heart">
					<svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor">
						<path
							d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z" /></svg>
				</div>
			</div>
			<div class="bcard__info">
				<div>
					<div class="bcard__title">Forrest Grump</div>
					<div class="bcard__genre">Action</div>
				</div>
				<div class="bcard__year">2023</div>
			</div>
		</div>

		<div class="bcard">
			<div class="bcard__poster">
				<div class="bcard__heart">
					<svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor">
						<path
							d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z" /></svg>
				</div>
			</div>
			<div class="bcard__info">
				<div>
					<div class="bcard__title">Young Sheldon</div>
					<div class="bcard__genre">Biography</div>
				</div>
				<div class="bcard__year">2021</div>
			</div>
		</div>

	</div>

	<%@ include file="/components/footer.jsp"%>
	
</body>
</html>
