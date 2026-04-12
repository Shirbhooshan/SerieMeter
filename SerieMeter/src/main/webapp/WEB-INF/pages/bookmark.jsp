<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored = "false"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Seriemeter – Bookmarks</title>
  <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet"/>

  <style>
    /* ── RESET & BASE ── */
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

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
      font-family: 'DM Sans', sans-serif;
      color: var(--text);
      background: var(--white);
      min-height: 100vh;
    }

    a { text-decoration: none; color: inherit; }

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

    /* right side: bookmark icon (green filled) + avatar circle */
    .navbar__right {
      margin-left: auto;
      display: flex;
      align-items: center;
      gap: 14px;
    }

    .navbar__bookmark-icon {
      width: 28px;
      height: 28px;
      display: flex;
      align-items: center;
      justify-content: center;
      color: #4caf50;
    }

    .navbar__avatar {
      width: 36px;
      height: 36px;
      border-radius: 50%;
      background: var(--white);
      border: 2px solid rgba(255,255,255,0.3);
    }

    /* ── PAGE HEADER ── */
    .page-header {
      padding: 48px 60px 40px;
      display: flex;
      align-items: flex-start;
      justify-content: space-between;
    }

    .page-header__left {}

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
      font-family: 'DM Sans', sans-serif;
      font-size: 14px;
      font-weight: 700;
      letter-spacing: 1px;
      text-transform: uppercase;
      cursor: pointer;
      white-space: nowrap;
      margin-top: 8px;
      transition: background .2s;
    }
    .btn-clear:hover { background: #333; }

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

    /* heart button on poster */
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
      box-shadow: 0 2px 6px rgba(0,0,0,0.15);
    }
    .bcard__heart svg { color: #e53935; }

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

    /* ── FOOTER ── */
    .footer {
      background: var(--black);
      color: var(--white);
      padding: 60px 60px 40px;
      display: grid;
      grid-template-columns: 1fr 1fr 1fr;
      gap: 40px;
    }

    .footer__brand p {
      font-size: 13px;
      color: rgba(255,255,255,0.55);
      margin-top: 16px;
      line-height: 1.7;
      max-width: 200px;
    }

    .footer-logo {
      display: flex;
      align-items: center;
      gap: 8px;
      font-size: 18px;
      font-weight: 700;
    }

    .footer__col h4 {
      font-size: 11px;
      letter-spacing: 1.5px;
      text-transform: uppercase;
      color: var(--orange);
      margin-bottom: 20px;
      font-weight: 700;
    }
    .footer__col ul { list-style: none; display: flex; flex-direction: column; gap: 12px; }
    .footer__col ul li a {
      font-size: 14px;
      color: rgba(255,255,255,0.7);
      transition: color .15s;
    }
    .footer__col ul li a:hover { color: var(--white); }

    .footer__bottom {
      background: var(--black);
      padding: 20px 60px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      border-top: 1px solid rgba(255,255,255,0.1);
      font-size: 13px;
      color: rgba(255,255,255,0.4);
    }
  </style>
</head>

<body>

<!-- ═══════════════════════════════════════════════
     NAVBAR
════════════════════════════════════════════════ -->
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

  <div class="navbar__right">
    <!-- bookmark icon (filled green = active state) -->
    <div class="navbar__bookmark-icon">
      <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor">
        <path d="M19 21l-7-5-7 5V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2z"/>
      </svg>
    </div>
    <!-- user avatar circle -->
    <div class="navbar__avatar"></div>
  </div>
</nav>


<!--PAGE HEADER-->
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


<!--BOOKMARKS GRID-->
<div class="bookmarks-grid">

  <!-- Card 1 -->
  <div class="bcard">
    <div class="bcard__poster">
      <div class="bcard__heart">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor">
          <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/>
        </svg>
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

  <!-- Card 2 -->
  <div class="bcard">
    <div class="bcard__poster">
      <div class="bcard__heart">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor">
          <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/>
        </svg>
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

  <!-- Card 3 -->
  <div class="bcard">
    <div class="bcard__poster">
      <div class="bcard__heart">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor">
          <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/>
        </svg>
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

  <!-- Card 4 -->
  <div class="bcard">
    <div class="bcard__poster">
      <div class="bcard__heart">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor">
          <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/>
        </svg>
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

  <!-- Card 5 -->
  <div class="bcard">
    <div class="bcard__poster">
      <div class="bcard__heart">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor">
          <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/>
        </svg>
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

  <!-- Card 6 -->
  <div class="bcard">
    <div class="bcard__poster">
      <div class="bcard__heart">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor">
          <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/>
        </svg>
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

  <!-- Card 7 -->
  <div class="bcard">
    <div class="bcard__poster">
      <div class="bcard__heart">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor">
          <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/>
        </svg>
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

  <!-- Card 8 -->
  <div class="bcard">
    <div class="bcard__poster">
      <div class="bcard__heart">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor">
          <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/>
        </svg>
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

</div><!-- /bookmarks-grid -->


<!--FOOTER-->
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