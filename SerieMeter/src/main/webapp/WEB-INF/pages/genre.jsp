<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored = "false"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>SerieMeter – Genre</title>
  <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet"/>

  <style>
    /* reset and base  */
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    :root {
      --orange:   #E8824A;
      --black:    #0D0D0D;
      --white:    #FFFFFF;
      --gray-100: #F5F5F5;
      --gray-200: #E8E8E8;
      --gray-300: #CCCCCC;
      --gray-400: #AAAAAA;
      --gray-600: #666666;
      --text:     #1A1A1A;
    }

    body {
      font-family: 'DM Sans', sans-serif;
      background: var(--white);        /* WHITE background like screenshot */
      color: var(--text);
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }

    a { text-decoration: none; color: inherit; }

    /* Navbar */
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

    /* 3x3 dot grid logo */
    .logo-icon {
      display: grid;
      grid-template-columns: repeat(3, 5px);
      grid-template-rows: repeat(3, 5px);
      gap: 2px;
    }
    .logo-icon span { display: block; background: var(--orange); border-radius: 1px; }
    .logo-icon span:nth-child(even) { background: #c06030; }

    .navbar__logo {
      display: flex;
      align-items: center;
      gap: 8px;
      font-size: 20px;
      font-weight: 700;
      color: var(--white);
      white-space: nowrap;
    }
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

    .navbar__right {
      margin-left: auto;
      display: flex;
      align-items: center;
      gap: 14px;
    }

    /* search bar */
    .search-bar {
      display: flex;
      align-items: center;
      background: #1e1e1e;
      border: 1px solid #333;
      border-radius: 20px;
      padding: 7px 14px;
      gap: 8px;
      width: 230px;
    }
    .search-bar input {
      background: transparent;
      border: none;
      outline: none;
      color: #aaa;
      font-size: 13px;
      font-family: 'DM Sans', sans-serif;
      width: 100%;
    }
    .search-bar input::placeholder { color: #555; }
    .search-bar svg { flex-shrink: 0; color: #666; }

    /* bell */
    .bell-btn {
      background: none;
      border: none;
      cursor: pointer;
      color: #aaa;
      display: flex;
      align-items: center;
    }

    /* sign up */
    .signup-btn {
      background: var(--orange);
      color: var(--white);
      border: none;
      border-radius: 20px;
      padding: 8px 20px;
      font-size: 14px;
      font-family: 'DM Sans', sans-serif;
      font-weight: 600;
      cursor: pointer;
      transition: background .2s;
    }
    .signup-btn:hover { background: #c06030; }

    /* page body */
    .page-body {
      display: flex;
      flex: 1;
      padding: 30px 40px;
      gap: 30px;
      align-items: flex-start;
      background: var(--white);
    }

    /* side bar */
    .sidebar {
      width: 260px;
      min-width: 260px;
      background: var(--white);
      border: 2px solid #3399ff;     /* blue border — exactly like screenshot */
      border-radius: 10px;
      padding: 20px 18px;
    }

    .sidebar__title {
      font-size: 17px;
      font-weight: 700;
      margin-bottom: 18px;
      color: var(--text);
    }

    /* uppercase label row */
    .filter-label {
      font-size: 10px;
      font-weight: 700;
      letter-spacing: 1.4px;
      text-transform: uppercase;
      color: var(--gray-600);
      margin-top: 18px;
      margin-bottom: 10px;
    }

    /* Movie/Series */
    .pill-row { display: flex; gap: 10px; }

    .pill {
      padding: 7px 18px;
      border-radius: 20px;
      font-size: 13px;
      font-family: 'DM Sans', sans-serif;
      font-weight: 600;
      cursor: pointer;
      border: none;
      transition: background .2s, color .2s;
    }
    .pill.active   { background: var(--black); color: var(--white); }
    .pill.inactive { background: var(--gray-200); color: var(--gray-600); }
    .pill:hover    { background: #444; color: var(--white); }

    /* Genre grid*/
    .genre-grid {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 8px;
    }
    .genre-tag {
      padding: 8px 10px;
      background: var(--gray-100);
      border-radius: 6px;
      font-size: 13px;
      color: var(--gray-600);
      text-align: center;
      cursor: pointer;
      border: 1px solid transparent;
      transition: background .2s, color .2s;
    }
    .genre-tag:hover,
    .genre-tag.on { background: var(--orange); color: var(--white); border-color: var(--orange); }

    /* ---- Year dropdown ---- */
    .year-select {
      width: 100%;
      background: var(--white);
      border: 1px solid var(--gray-300);
      border-radius: 6px;
      color: var(--text);
      padding: 9px 12px;
      font-size: 13px;
      font-family: 'DM Sans', sans-serif;
      cursor: pointer;
      appearance: none;
      -webkit-appearance: none;
      background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='10' height='6'%3E%3Cpath fill='%23888' d='M5 6L0 0h10z'/%3E%3C/svg%3E");
      background-repeat: no-repeat;
      background-position: right 12px center;
    }
    .year-select:focus { outline: none; border-color: var(--orange); }

    /* Rating */
    .rating-row { display: flex; gap: 8px; }

    .rating-pill {
      flex: 1;
      padding: 8px 0;
      background: var(--white);
      border: 1px solid var(--gray-300);
      border-radius: 6px;
      color: var(--gray-600);
      font-size: 13px;
      font-family: 'DM Sans', sans-serif;
      font-weight: 600;
      cursor: pointer;
      text-align: center;
      transition: background .2s, color .2s;
    }
    .rating-pill:hover,
    .rating-pill.on { background: var(--orange); color: var(--white); border-color: var(--orange); }

    /* Reset button */
    .reset-btn {
      width: 100%;
      margin-top: 22px;
      padding: 12px;
      background: var(--black);
      color: var(--white);
      border: none;
      border-radius: 24px;
      font-size: 14px;
      font-family: 'DM Sans', sans-serif;
      font-weight: 600;
      cursor: pointer;
      transition: background .2s;
    }
    .reset-btn:hover { background: #333; }

    /* Genre content */
    .content { flex: 1; }

    .content__heading {
      font-size: 44px;
      font-weight: 800;
      letter-spacing: -1px;
      color: var(--text);
      line-height: 1;
    }
    .content__sub {
      font-size: 14px;
      color: var(--gray-400);
      margin-top: 5px;
      margin-bottom: 18px;
    }

    /* sort row */
    .sort-row {
      display: flex;
      align-items: center;
      justify-content: flex-end;
      gap: 10px;
      margin-bottom: 22px;
    }
    .sort-label {
      font-size: 11px;
      font-weight: 700;
      letter-spacing: 1.2px;
      text-transform: uppercase;
      color: var(--gray-400);
    }
    .sort-select {
      background: var(--white);
      border: 1px solid var(--gray-300);
      border-radius: 6px;
      color: var(--text);
      padding: 7px 28px 7px 12px;
      font-size: 13px;
      font-family: 'DM Sans', sans-serif;
      cursor: pointer;
      appearance: none;
      -webkit-appearance: none;
      background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='10' height='6'%3E%3Cpath fill='%23888' d='M5 6L0 0h10z'/%3E%3C/svg%3E");
      background-repeat: no-repeat;
      background-position: right 10px center;
    }
    .sort-select:focus { outline: none; }

    /* Cards */
    .cards-grid {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 20px 18px;
    }

    .card { cursor: pointer; }
    .card:hover .card__poster { transform: translateY(-4px); }

    /* grey poster — light grey on white background */
    .card__poster {
      width: 100%;
      aspect-ratio: 2/3;
      background: var(--gray-200);
      border-radius: 10px;
      transition: transform .2s;
      margin-bottom: 10px;
    }

    .card__row {
      display: flex;
      align-items: flex-start;
      justify-content: space-between;
      gap: 6px;
    }
    .card__title {
      font-size: 14px;
      font-weight: 700;
      color: var(--text);
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
      flex: 1;
    }
    .card__year {
      font-size: 13px;
      color: var(--gray-400);
      white-space: nowrap;
    }
    .card__genre {
      font-size: 10px;
      font-weight: 700;
      letter-spacing: 1px;
      text-transform: uppercase;
      color: var(--gray-400);
      margin-top: 3px;
    }

    /* Load more button */
    .load-more-wrap {
      display: flex;
      justify-content: center;
      margin: 36px 0 16px;
    }
    .load-more-btn {
      background: var(--black);
      color: var(--white);
      border: none;
      border-radius: 30px;
      padding: 15px 60px;
      font-size: 15px;
      font-family: 'DM Sans', sans-serif;
      font-weight: 600;
      cursor: pointer;
      transition: background .2s;
    }
    .load-more-btn:hover { background: #333; }

    /* Footer */
    .footer {
      background: var(--black);
      padding: 50px 60px 0;
      display: grid;
      grid-template-columns: 1fr 1fr 1fr;
      gap: 40px;
      margin-top: auto;
    }

    .footer__brand p {
      font-size: 13px;
      color: rgba(255,255,255,0.5);
      margin-top: 14px;
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
      margin-bottom: 18px;
      font-weight: 700;
    }
    .footer__col ul { list-style: none; display: flex; flex-direction: column; gap: 12px; }
    .footer__col ul li a {
      font-size: 14px;
      color: rgba(255,255,255,0.65);
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
      color: rgba(255,255,255,0.35);
    }
  </style>
</head>
<body>

<!-- Navbar -->
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
    <div class="search-bar">
      <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/>
      </svg>
      <input type="text" placeholder="Search for movies and series..."/>
    </div>
    <button class="bell-btn">
      <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"/>
        <path d="M13.73 21a2 2 0 0 1-3.46 0"/>
      </svg>
    </button>
    <button class="signup-btn">Sign up</button>
  </div>
</nav>


<!-- Body -->
<div class="page-body">

  <!-- Side bar -->
  <aside class="sidebar">
    <div class="sidebar__title">Filters</div>

    <div class="filter-label">Category Type</div>
    <div class="pill-row">
      <button class="pill active"   onclick="selectCat(this)">Movie</button>
      <button class="pill inactive" onclick="selectCat(this)">Series</button>
    </div>

    <div class="filter-label">Genre</div>
    <div class="genre-grid">
      <div class="genre-tag" onclick="this.classList.toggle('on')">Drama</div>
      <div class="genre-tag" onclick="this.classList.toggle('on')">Fantasy</div>
      <div class="genre-tag" onclick="this.classList.toggle('on')">Comedy</div>
      <div class="genre-tag" onclick="this.classList.toggle('on')">Thriller</div>
      <div class="genre-tag" onclick="this.classList.toggle('on')">Horror</div>
      <div class="genre-tag" onclick="this.classList.toggle('on')">Animation</div>
      <div class="genre-tag" onclick="this.classList.toggle('on')">Science Fiction</div>
      <div class="genre-tag" onclick="this.classList.toggle('on')">Romance</div>
    </div>

    <div class="filter-label">Release Year</div>
    <select class="year-select">
      <option>2020-2024</option>
      <option>2015-2019</option>
      <option>2010-2014</option>
      <option>2000-2009</option>
      <option>Before 2000</option>
    </select>

    <div class="filter-label">Minimum Rating</div>
    <div class="rating-row">
      <button class="rating-pill" onclick="selectRating(this)">7+</button>
      <button class="rating-pill" onclick="selectRating(this)">8+</button>
      <button class="rating-pill" onclick="selectRating(this)">9+</button>
    </div>

    <button class="reset-btn" onclick="resetAll()">Reset All Filters</button>
  </aside>


  <!-- Genre Content -->
  <main class="content">

    <h1 class="content__heading">[Genre]</h1>
    <p class="content__sub">Curated results for [genre]</p>

    <div class="sort-row">
      <span class="sort-label">Sort By</span>
      <select class="sort-select">
        <option>Top Rated</option>
        <option>Newest First</option>
        <option>Oldest First</option>
        <option>A – Z</option>
      </select>
    </div>

    <div class="cards-grid">

      <div class="card">
        <div class="card__poster"></div>
        <div class="card__row">
          <span class="card__title">School of Good &amp;...</span>
          <span class="card__year">2019</span>
        </div>
        <div class="card__genre">Fantasy</div>
      </div>

      <div class="card">
        <div class="card__poster"></div>
        <div class="card__row">
          <span class="card__title">Alice In Wonder...</span>
          <span class="card__year">2021</span>
        </div>
        <div class="card__genre">Sci-Fi</div>
      </div>

      <div class="card">
        <div class="card__poster"></div>
        <div class="card__row">
          <span class="card__title">Narnia</span>
          <span class="card__year">2018</span>
        </div>
        <div class="card__genre">Thriller</div>
      </div>

      <div class="card">
        <div class="card__poster"></div>
        <div class="card__row">
          <span class="card__title">The Secret of M...</span>
          <span class="card__year">2022</span>
        </div>
        <div class="card__genre">Action</div>
      </div>

      <div class="card">
        <div class="card__poster"></div>
        <div class="card__row">
          <span class="card__title">Coraline</span>
          <span class="card__year">2017</span>
        </div>
        <div class="card__genre">Drama</div>
      </div>

      <div class="card">
        <div class="card__poster"></div>
        <div class="card__row">
          <span class="card__title">Kungfu Panda</span>
          <span class="card__year">2020</span>
        </div>
        <div class="card__genre">Cyberpunk</div>
      </div>

      <div class="card">
        <div class="card__poster"></div>
        <div class="card__row">
          <span class="card__title">Up</span>
          <span class="card__year">2019</span>
        </div>
        <div class="card__genre">Mystery</div>
      </div>

      <div class="card">
        <div class="card__poster"></div>
        <div class="card__row">
          <span class="card__title">How To Train Your...</span>
          <span class="card__year">2021</span>
        </div>
        <div class="card__genre">Romance</div>
      </div>

    </div><!-- /cards-grid -->

    <div class="load-more-wrap">
      <button class="load-more-btn">Load more..</button>
    </div>

  </main>

</div><!-- /page-body -->


<!-- Footer -->
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


<!-- JavaScript -->
<script>
  function selectCat(btn) {
    document.querySelectorAll('.pill').forEach(function(b) {
      b.classList.remove('active');
      b.classList.add('inactive');
    });
    btn.classList.remove('inactive');
    btn.classList.add('active');
  }

  function selectRating(btn) {
    document.querySelectorAll('.rating-pill').forEach(function(b) {
      b.classList.remove('on');
    });
    btn.classList.add('on');
  }

  function resetAll() {
    var pills = document.querySelectorAll('.pill');
    pills[0].classList.add('active');    pills[0].classList.remove('inactive');
    pills[1].classList.add('inactive');  pills[1].classList.remove('active');
    document.querySelectorAll('.genre-tag').forEach(function(t) { t.classList.remove('on'); });
    document.querySelector('.year-select').selectedIndex = 0;
    document.querySelectorAll('.rating-pill').forEach(function(b) { b.classList.remove('on'); });
  }
</script>

</body>
</html>