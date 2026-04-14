<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored = "false"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Seriemeter – Explore</title>
  <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap" rel="stylesheet"/>

  <style>
    /* ── RESET & BASE ── */
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    :root {
      --orange: #E8824A;
      --orange-light: #F0A070;
      --black: #0D0D0D;
      --dark: #1A1A1A;
      --white: #FFFFFF;
      --gray-100: #F5F5F5;
      --gray-200: #E8E8E8;
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

    a { text-decoration: none; color: inherit; }
    img { display: block; width: 100%; }

    /* ── NAVBAR ── */
    .navbar {
      background: var(--black);
      display: flex;
      align-items: center;
      padding: 0 40px;
      height: 60px;
      gap: 40px;
      position: sticky;
      top: 0;
      z-index: 100;
    }

    .navbar__logo {
      display: flex;
      align-items: center;
      gap: 8px;
      font-size: 20px;
      font-weight: 700;
      color: var(--white);
      white-space: nowrap;
    }

    .logo-icon {
      display: grid;
      grid-template-columns: repeat(3, 5px);
      grid-template-rows: repeat(3, 5px);
      gap: 2px;
    }
    .logo-icon span { display: block; background: var(--orange); border-radius: 1px; }
    .logo-icon span:nth-child(even) { background: #c06030; }

    .logo-text-serie { color: var(--orange); }
    .logo-text-meter { color: var(--white); }

    .navbar__nav {
      display: flex;
      gap: 30px;
      list-style: none;
      margin-left: 10px;
    }
    .navbar__nav a {
      color: var(--white);
      font-size: 14px;
      font-weight: 500;
      opacity: 0.85;
      transition: opacity .2s;
    }
    .navbar__nav a:hover { opacity: 1; }

    .navbar__search {
      margin-left: auto;
      display: flex;
      align-items: center;
      background: rgba(255,255,255,0.12);
      border: 1px solid rgba(255,255,255,0.2);
      border-radius: 20px;
      padding: 6px 14px;
      gap: 8px;
    }
    .navbar__search input {
      background: transparent;
      border: none;
      outline: none;
      color: var(--white);
      font-family: 'Manrope', sans-serif;
      font-size: 13px;
      width: 200px;
    }
    .navbar__search input::placeholder { color: rgba(255,255,255,0.5); }
    .navbar__search svg { color: rgba(255,255,255,0.5); flex-shrink: 0; }

    .navbar__bookmark {
      background: transparent;
      border: none;
      cursor: pointer;
      padding: 6px;
      color: var(--white);
    }

    .btn-signup {
      background: var(--orange);
      color: var(--white);
      border: none;
      border-radius: 20px;
      padding: 8px 20px;
      font-family: 'Manrope', sans-serif;
      font-size: 14px;
      font-weight: 600;
      cursor: pointer;
      white-space: nowrap;
      transition: background .2s;
    }
    .btn-signup:hover { background: var(--orange-light); }

    /* Hero Banner */
    .hero {
      position: relative;
      margin: 24px 40px 0;
      border-radius: 16px;
      overflow: hidden;
      height: 240px;
      background: linear-gradient(135deg, #1a0533 0%, #2d1060 40%, #4a1a80 60%, #7b3fbf 100%);
    }

    .hero__bg {
      position: absolute;
      inset: 0;
      background:
        radial-gradient(ellipse at 70% 50%, rgba(100,60,160,0.6) 0%, transparent 60%),
        radial-gradient(ellipse at 30% 80%, rgba(30,10,60,0.8) 0%, transparent 50%),
        linear-gradient(135deg, #110322 0%, #3d1a70 50%, #5a2a90 100%);
    }

    .hero__figures {
      position: absolute;
      right: 140px;
      bottom: 0;
      width: 280px;
      height: 220px;
      background:
        radial-gradient(ellipse 60px 80px at 55% 40%, rgba(230,185,60,0.35) 0%, transparent 70%),
        radial-gradient(ellipse 50px 90px at 42% 38%, rgba(200,160,40,0.25) 0%, transparent 70%);
    }

    .hero__city {
      position: absolute;
      bottom: 0;
      left: 0;
      right: 0;
      height: 80px;
      background: linear-gradient(to top, rgba(80,40,120,0.4) 0%, transparent 100%);
    }

    .hero__mountains {
      position: absolute;
      bottom: 30px;
      left: 0;
      right: 0;
      height: 100px;
      background: linear-gradient(to top, rgba(60,20,100,0.5) 0%, transparent 60%);
    }

    .hero__overlay {
      position: absolute;
      inset: 0;
      background: linear-gradient(to right, rgba(0,0,0,0.75) 0%, rgba(0,0,0,0.3) 50%, transparent 80%);
    }

    .hero__content {
      position: relative;
      z-index: 2;
      padding: 28px 32px;
      height: 100%;
      display: flex;
      flex-direction: column;
      justify-content: flex-end;
      gap: 8px;
    }

    .hero__badges { display: flex; gap: 8px; margin-bottom: 6px; }
    .badge {
      padding: 3px 10px;
      border-radius: 12px;
      font-size: 10px;
      font-weight: 700;
      letter-spacing: .6px;
      text-transform: uppercase;
    }
    .badge--trending { background: var(--orange); color: white; }
    .badge--genre    { background: rgba(255,255,255,0.2); color: white; border: 1px solid rgba(255,255,255,0.3); }

    .hero__title {
      font-size: 36px;
      font-weight: 800;
      color: var(--white);
      letter-spacing: -0.5px;
      line-height: 1.1;
    }

    .hero__meta {
      display: flex;
      align-items: center;
      gap: 8px;
      color: rgba(255,255,255,0.7);
      font-size: 13px;
    }
    .hero__meta .star { color: #f4c542; }
    .hero__meta .dot { opacity: 0.5; }

    .hero__btn {
      position: absolute;
      right: 32px;
      bottom: 32px;
      background: var(--orange);
      color: white;
      border: none;
      border-radius: 28px;
      padding: 12px 24px;
      font-family: 'Manrope', sans-serif;
      font-size: 15px;
      font-weight: 600;
      cursor: pointer;
      display: flex;
      align-items: center;
      gap: 8px;
      transition: background .2s, transform .15s;
    }
    .hero__btn:hover { background: var(--orange-light); transform: translateY(-1px); }

    .hero__dots { display: flex; justify-content: center; gap: 8px; margin-top: 14px; }
    .hero__dots span {
      display: block;
      height: 4px;
      border-radius: 2px;
      background: var(--gray-200);
      cursor: pointer;
    }
    .hero__dots span.active { background: var(--black); width: 32px; }
    .hero__dots span:not(.active) { width: 32px; opacity: 0.4; }

    /* Main Layout */
    .main-layout { display: flex; gap: 0; padding: 40px 40px 0; }

    .sidebar { width: 140px; flex-shrink: 0; padding-top: 4px; }
    .sidebar__title { font-size: 15px; font-weight: 700; margin-bottom: 4px; }
    .sidebar__sortby { font-size: 12px; color: var(--gray-400); margin-bottom: 20px; }
    .sidebar__list { list-style: none; display: flex; flex-direction: column; gap: 14px; }
    .sidebar__list li a { font-size: 14px; color: var(--text); font-weight: 400; transition: color .15s; }
    .sidebar__list li a:hover { color: var(--orange); }

    .content { flex: 1; min-width: 0; }

    .section-header {
      display: flex;
      justify-content: space-between;
      align-items: flex-end;
      margin-bottom: 4px;
    }
    .section-header__left h2 { font-size: 26px; font-weight: 700; letter-spacing: -0.3px; }
    .section-header__left p { font-size: 13px; color: var(--gray-400); margin-top: 2px; }
    .see-more { font-size: 13px; color: var(--gray-600); font-weight: 500; transition: color .15s; }
    .see-more:hover { color: var(--orange); }

    .section-divider { height: 1px; background: var(--gray-200); margin-bottom: 24px; }

    .grid-3 {
      display: grid;
      grid-template-columns: repeat(3, 260px);
      justify-content: center;
      gap: 20px;
    }

    /* Movie Card */
    .card { cursor: pointer; }
    .card__poster {
      width: 100%;
      aspect-ratio: 2/3;
      border-radius: 12px;
      overflow: hidden;
      background: var(--gray-200);
      margin-bottom: 10px;
    }
    .card__poster img { width: 100%; height: 100%; object-fit: cover; transition: transform .3s; }
    .card:hover .card__poster img { transform: scale(1.04); }

    .card__title { font-size: 14px; font-weight: 600; margin-bottom: 4px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
    .card__meta { display: flex; align-items: center; gap: 6px; font-size: 12px; color: var(--gray-400); }
    .card__meta .star { color: #f4c542; font-size: 11px; }
    .card__meta .genre-tag {
      background: var(--gray-100);
      border-radius: 4px;
      padding: 1px 6px;
      font-size: 11px;
      color: var(--gray-600);
    }

    .load-more-wrap { display: flex; justify-content: flex-end; margin-top: 28px; margin-bottom: 60px; }
    .btn-load-more {
      background: var(--black);
      color: var(--white);
      border: none;
      border-radius: 28px;
      padding: 14px 36px;
      font-family: 'Manrope', sans-serif;
      font-size: 15px;
      font-weight: 600;
      cursor: pointer;
      transition: background .2s;
    }
    .btn-load-more:hover { background: #333; }

    /* CTA Banner */
    .cta-banner {
      background: var(--orange);
      border-radius: 20px;
      margin: 0 40px 60px;
      padding: 48px 60px;
      display: flex;
      align-items: center;
      justify-content: space-between;
      position: relative;
      overflow: hidden;
    }
    .cta-banner::before, .cta-banner::after {
      content: '';
      position: absolute;
      border-radius: 50%;
      border: 2px solid rgba(255,255,255,0.25);
    }
    .cta-banner::before { width: 180px; height: 180px; left: -50px; top: -50px; }
    .cta-banner::after  { width: 120px; height: 120px; left: 30px; top: 80px; border-color: rgba(255,255,255,0.15); }

    .cta-banner__text { position: relative; z-index: 1; max-width: 500px; }
    .cta-banner__text h2 { font-size: 32px; font-weight: 800; color: var(--white); line-height: 1.2; margin-bottom: 12px; }
    .cta-banner__text p { font-size: 14px; color: rgba(255,255,255,0.85); line-height: 1.6; }

    .cta-banner__action { position: relative; z-index: 1; }
    .btn-start {
      background: rgba(255,255,255,0.25);
      color: var(--white);
      border: 2px solid rgba(255,255,255,0.5);
      border-radius: 28px;
      padding: 14px 32px;
      font-family: 'Manrope', sans-serif;
      font-size: 15px;
      font-weight: 600;
      cursor: pointer;
      white-space: nowrap;
      transition: background .2s;
    }
    .btn-start:hover { background: rgba(255,255,255,0.4); }

    /* Movie & Series Section */
    .section { padding: 0 40px; margin-bottom: 60px; }
    .section .section-header { margin-bottom: 4px; }
    .section .section-header h2 { font-size: 28px; }

    .grid-5 { display: grid; grid-template-columns: repeat(5, 1fr); gap: 20px; }

    /* Footer  */
    .footer {
      background: var(--black);
      color: var(--white);
      padding: 60px 40px 40px;
      display: grid;
      grid-template-columns: 1fr 1fr 1fr;
      gap: 40px;
    }

    .footer__brand p { font-size: 13px; color: rgba(255,255,255,0.55); margin-top: 16px; line-height: 1.7; max-width: 200px; }

    .footer__col h4 { font-size: 11px; letter-spacing: 1.5px; text-transform: uppercase; color: var(--orange); margin-bottom: 20px; font-weight: 700; }
    .footer__col ul { list-style: none; display: flex; flex-direction: column; gap: 12px; }
    .footer__col ul li a { font-size: 14px; color: rgba(255,255,255,0.7); transition: color .15s; }
    .footer__col ul li a:hover { color: var(--white); }

    .footer__bottom {
      background: var(--black);
      padding: 20px 40px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      border-top: 1px solid rgba(255,255,255,0.1);
      font-size: 13px;
      color: rgba(255,255,255,0.4);
    }

    .footer-logo { display: flex; align-items: center; gap: 8px; font-size: 18px; font-weight: 700; }
  </style>
</head>

<body>

<nav class="navbar">
  <div class="navbar__logo">
    <div class="logo-icon">
      <span></span><span></span><span></span>
      <span></span><span></span><span></span>
      <span></span><span></span><span></span>
    </div>
    <span><span class="logo-text-serie">Serie</span><span class="logo-text-meter">meter</span></span>
  </div>

  <ul class="navbar__nav">
    <li><a href="#">Explore</a></li>
    <li><a href="#">Movies</a></li>
    <li><a href="#">Series</a></li>
    <li><a href="#">About Us</a></li>
  </ul>

  <div class="navbar__search">
    <svg width="14" height="14" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
      <circle cx="11" cy="11" r="8"/><path d="m21 21-4.35-4.35"/>
    </svg>
    <input type="text" placeholder="Search for movies and series…" />
  </div>

  <button class="navbar__bookmark" aria-label="Bookmarks">
    <svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
      <path d="M19 21l-7-5-7 5V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2z"/>
    </svg>
  </button>

  <button class="btn-signup">Sign up</button>
</nav>

<div class="hero">
  <div class="hero__bg"></div>
  <div class="hero__mountains"></div>
  <div class="hero__figures"></div>
  <div class="hero__city"></div>
  <div class="hero__overlay"></div>
  <div class="hero__content">
    <div class="hero__badges">
      <span class="badge badge--trending">TRENDING</span>
      <span class="badge badge--genre">[GENRE]</span>
    </div>
    <h1 class="hero__title">MOVIE NAME</h1>
    <div class="hero__meta">
      <span class="star">★</span><span>4.9</span>
      <span class="dot">•</span><span>2024</span>
      <span class="dot">•</span><span>~2h</span>
    </div>
  </div>
  <button class="hero__btn">
    View Details
    <svg width="16" height="16" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24">
      <path d="M5 12h14M12 5l7 7-7 7"/>
    </svg>
  </button>
</div>

<div class="hero__dots">
  <span class="active"></span><span></span><span></span>
</div>

<div class="main-layout">
  <aside class="sidebar">
    <h3 class="sidebar__title">Genres</h3>
    <p class="sidebar__sortby">Sort by</p>
    <ul class="sidebar__list">
      <li><a href="#">Action</a></li>
      <li><a href="#">Comedy</a></li>
      <li><a href="#">Thriller</a></li>
      <li><a href="#">Sci-Fi</a></li>
      <li><a href="#">Romance</a></li>
      <li><a href="#">Horror</a></li>
      <li><a href="#">Fantasy</a></li>
      <li><a href="#">Animation</a></li>
    </ul>
  </aside>

  <div class="content">
    <div class="section-header">
      <div class="section-header__left">
        <h2>Trending</h2>
        <p>Most reviewed this week</p>
      </div>
    </div>
    <div class="section-divider"></div>

    <div class="grid-3">
      <div class="card"><div class="card__poster"></div><div class="card__title">One Piece</div><div class="card__meta"><span class="star">★</span><span>4.9</span><span class="genre-tag">[Genre]</span></div></div>
      <div class="card"><div class="card__poster"></div><div class="card__title">Project Hail Mary</div><div class="card__meta"><span class="star">★</span><span>4.9</span><span class="genre-tag">[Genre]</span></div></div>
      <div class="card"><div class="card__poster"></div><div class="card__title">The Ballad of Songbir…</div><div class="card__meta"><span class="star">★</span><span>4.9</span><span class="genre-tag">[Genre]</span></div></div>
      <div class="card"><div class="card__poster"></div><div class="card__title">Spiderman Across …</div><div class="card__meta"><span class="star">★</span><span>4.9</span><span class="genre-tag">[Genre]</span></div></div>
      <div class="card"><div class="card__poster"></div><div class="card__title">La La Land</div><div class="card__meta"><span class="star">★</span><span>4.9</span><span class="genre-tag">[Genre]</span></div></div>
      <div class="card"><div class="card__poster"></div><div class="card__title">Emily in Paris</div><div class="card__meta"><span class="star">★</span><span>4.9</span><span class="genre-tag">[Genre]</span></div></div>
    </div>

    <div class="load-more-wrap">
      <button class="btn-load-more">Load more..</button>
    </div>
  </div>
</div>

<div class="cta-banner">
  <div class="cta-banner__text">
    <h2>Your voice is the final cut.</h2>
    <p>Seriemeter is more than just a database, it's a democracy of taste. Join a community of thousands scoring the world's most important films.</p>
  </div>
  <div class="cta-banner__action">
    <button class="btn-start">Start reviewing..</button>
  </div>
</div>

<div class="section">
  <div class="section-header">
    <div class="section-header__left"><h2>Movies</h2></div>
    <a href="#" class="see-more">See more..</a>
  </div>
  <div class="section-divider"></div>
  <div class="grid-5">
    <div class="card"><div class="card__poster"></div><div class="card__title">Harry Potter & the…</div><div class="card__meta"><span class="star">★</span><span>4.9</span><span class="genre-tag">[Genre]</span></div></div>
    <div class="card"><div class="card__poster"></div><div class="card__title">Avengers: Endgame</div><div class="card__meta"><span class="star">★</span><span>4.9</span><span class="genre-tag">[Genre]</span></div></div>
    <div class="card"><div class="card__poster"></div><div class="card__title">Avatar: Fire & Ash</div><div class="card__meta"><span class="star">★</span><span>4.9</span><span class="genre-tag">[Genre]</span></div></div>
    <div class="card"><div class="card__poster"></div><div class="card__title">The Maze Runner</div><div class="card__meta"><span class="star">★</span><span>4.9</span><span class="genre-tag">[Genre]</span></div></div>
    <div class="card"><div class="card__poster"></div><div class="card__title">Jumanji</div><div class="card__meta"><span class="star">★</span><span>4.9</span><span class="genre-tag">[Genre]</span></div></div>
    <div class="card"><div class="card__poster"></div><div class="card__title">Bird Box</div><div class="card__meta"><span class="star">★</span><span>4.9</span><span class="genre-tag">[Genre]</span></div></div>
    <div class="card"><div class="card__poster"></div><div class="card__title">Little Women</div><div class="card__meta"><span class="star">★</span><span>4.9</span><span class="genre-tag">[Genre]</span></div></div>
    <div class="card"><div class="card__poster"></div><div class="card__title">The Kite Runner</div><div class="card__meta"><span class="star">★</span><span>4.9</span><span class="genre-tag">[Genre]</span></div></div>
    <div class="card"><div class="card__poster"></div><div class="card__title">Mamma Mia!</div><div class="card__meta"><span class="star">★</span><span>4.9</span><span class="genre-tag">[Genre]</span></div></div>
    <div class="card"><div class="card__poster"></div><div class="card__title">Dead Poets Society</div><div class="card__meta"><span class="star">★</span><span>4.9</span><span class="genre-tag">[Genre]</span></div></div>
  </div>
</div>

<div class="section">
  <div class="section-header">
    <div class="section-header__left"><h2>Series</h2></div>
    <a href="#" class="see-more">See more..</a>
  </div>
  <div class="section-divider"></div>
  <div class="grid-5">
    <div class="card"><div class="card__poster"></div><div class="card__title">Modern Family</div><div class="card__meta"><span class="star">★</span><span>4.9</span><span class="genre-tag">[Genre]</span></div></div>
    <div class="card"><div class="card__poster"></div><div class="card__title">Queen's Gambit</div><div class="card__meta"><span class="star">★</span><span>4.9</span><span class="genre-tag">[Genre]</span></div></div>
    <div class="card"><div class="card__poster"></div><div class="card__title">Squid Game</div><div class="card__meta"><span class="star">★</span><span>4.9</span><span class="genre-tag">[Genre]</span></div></div>
    <div class="card"><div class="card__poster"></div><div class="card__title">A Good Girls Guide</div><div class="card__meta"><span class="star">★</span><span>4.9</span><span class="genre-tag">[Genre]</span></div></div>
    <div class="card"><div class="card__poster"></div><div class="card__title">The 100</div><div class="card__meta"><span class="star">★</span><span>4.9</span><span class="genre-tag">[Genre]</span></div></div>
    <div class="card"><div class="card__poster"></div><div class="card__title">Gilmore Girls</div><div class="card__meta"><span class="star">★</span><span>4.9</span><span class="genre-tag">[Genre]</span></div></div>
    <div class="card"><div class="card__poster"></div><div class="card__title">Bridgerton</div><div class="card__meta"><span class="star">★</span><span>4.9</span><span class="genre-tag">[Genre]</span></div></div>
    <div class="card"><div class="card__poster"></div><div class="card__title">Friends</div><div class="card__meta"><span class="star">★</span><span>4.9</span><span class="genre-tag">[Genre]</span></div></div>
    <div class="card"><div class="card__poster"></div><div class="card__title">A Knight of Seven</div><div class="card__meta"><span class="star">★</span><span>4.9</span><span class="genre-tag">[Genre]</span></div></div>
    <div class="card"><div class="card__poster"></div><div class="card__title">2 Broke Girls</div><div class="card__meta"><span class="star">★</span><span>4.9</span><span class="genre-tag">[Genre]</span></div></div>
  </div>
</div>

<footer>
  <div class="footer">
    <div class="footer__brand">
      <div class="footer-logo">
        <div class="logo-icon">
          <span></span><span></span><span></span>
          <span></span><span></span><span></span>
          <span></span><span></span><span></span>
        </div>
        <span><span class="logo-text-serie">Serie</span><span class="logo-text-meter">meter</span></span>
      </div>
      <p>Elevating cinematic conversation through expert ratings and curated insights. Your premium guide to the silver screen.</p>
    </div>
    <div class="footer__col">
      <h4>Explore</h4>
      <ul>
        <li><a href="#">Movies</a></li>
        <li><a href="#">Series</a></li>
        <li><a href="#">Global Search</a></li>
      </ul>
    </div>
    <div class="footer__col">
      <h4>Dev</h4>
      <ul>
        <li><a href="#">Documentation</a></li>
      </ul>
    </div>
  </div>
  <div class="footer__bottom">
    <span>© 2026 SerieMeter. All rights Reserved.</span>
    <span>ENGLISH (US)</span>
  </div>
</footer>

</body>
</html>
