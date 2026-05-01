
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Edit Medias – SerieMeter Admin</title>
  <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap" rel="stylesheet"/>

  <style>

    /* Base reset */
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    :root {
      --black:    #0D0D0D;
      --white:    #FFFFFF;
      --green:    #38A346;
      --orange:   #E8824A;
      --gray-100: #F5F5F5;
      --gray-200: #E8E8E8;
      --gray-400: #AAAAAA;
      --gray-600: #666666;
      --text:     #1A1A1A;
      --sidebar-w: 280px;
    }

    body {
      font-family: 'Manrope', sans-serif;
      background: var(--white);
      color: var(--text);
      min-height: 100vh;
      display: flex;
    }

    a { text-decoration: none; color: inherit; }
    img { display: block; }

    /* Sidebar — fixed on the left */
    .sm_admin__sidebar {
      width: var(--sidebar-w);
      min-height: 100vh;
      background: var(--black);
      display: flex;
      flex-direction: column;
      position: fixed;
      top: 0;
      left: 0;
      bottom: 0;
    }

    /* Logo section at top of sidebar */
    .sm_admin__sidebar_logo {
      padding: 28px 28px 24px;
      border-bottom: 1px solid rgba(255,255,255,0.08);
    }

    .sm_admin__sidebar_logo img {
      height: 36px;
      width: auto;
    }

    /* Nav links list in sidebar */
    .sm_admin__sidebar_nav {
      flex: 1;
      padding: 24px 16px;
      display: flex;
      flex-direction: column;
      gap: 6px;
    }

    /* Single nav link */
    .sm_admin__nav_item {
      display: flex;
      align-items: center;
      gap: 14px;
      padding: 12px 16px;
      border-radius: 10px;
      color: rgba(255,255,255,0.6);
      font-size: 15px;
      font-weight: 500;
      transition: background 0.2s, color 0.2s;
      cursor: pointer;
    }

    .sm_admin__nav_item:hover {
      background: rgba(255,255,255,0.08);
      color: #ffffff;
    }

    /* Green highlight for the currently active page */
    .sm_admin__nav_item.active {
      background: var(--green);
      color: #ffffff;
    }

    .sm_admin__nav_item img {
      width: 20px;
      height: 20px;
      filter: invert(1);
      opacity: 0.7;
    }

    .sm_admin__nav_item.active img { opacity: 1; }

    /* Logout button pinned to bottom of sidebar */
    .sm_admin__sidebar_logout {
      padding: 16px 16px 28px;
      border-top: 1px solid rgba(255,255,255,0.08);
    }

    .sm_admin__logout_btn {
      display: flex;
      align-items: center;
      gap: 14px;
      padding: 12px 16px;
      border-radius: 10px;
      color: rgba(255,255,255,0.6);
      font-size: 15px;
      font-weight: 500;
      cursor: pointer;
      transition: color 0.2s;
      background: none;
      border: none;
      width: 100%;
      font-family: 'Manrope', sans-serif;
    }

    .sm_admin__logout_btn:hover { color: #ffffff; }

    .sm_admin__logout_btn img {
      width: 20px;
      height: 20px;
      filter: invert(1);
      opacity: 0.7;
    }

    /* Main area — pushed right by sidebar width */
    .sm_admin__main {
      margin-left: var(--sidebar-w);
      flex: 1;
      display: flex;
      flex-direction: column;
      min-height: 100vh;
      background: var(--white);
    }

    /* Top bar: page title on left, user info on right */
    .sm_admin__topbar {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 18px 36px;
      border-bottom: 1px solid var(--gray-200);
      background: var(--white);
    }

    .sm_admin__topbar_title {
      font-size: 15px;
      font-weight: 600;
      color: var(--text);
    }

    .sm_admin__topbar_user {
      display: flex;
      align-items: center;
      gap: 12px;
    }

    .sm_admin__topbar_userinfo { text-align: right; }

    .sm_admin__topbar_name {
      font-size: 14px;
      font-weight: 700;
      color: var(--text);
    }

    .sm_admin__topbar_email {
      font-size: 12px;
      color: var(--gray-400);
    }

    /* Round avatar — profile pic loaded from backend later */
    .sm_admin__topbar_avatar {
      width: 40px;
      height: 40px;
      border-radius: 50%;
      background: var(--gray-200);
      overflow: hidden;
    }

    .sm_admin__topbar_avatar img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    /* White content area */
    .sm_admin__content {
      padding: 36px 36px 60px;
      flex: 1;
    }

    /* Page heading "Edit Medias" */
    .sm_admin__page_heading { margin-bottom: 28px; }

    .sm_admin__page_heading h1 {
      font-size: 42px;
      font-weight: 800;
      color: var(--text);
      line-height: 1.1;
    }

    /* "Medias" word in orange */
    .sm_admin__page_heading h1 span { color: var(--orange); }

    .sm_admin__page_heading p {
      font-size: 14px;
      color: var(--gray-400);
      margin-top: 6px;
    }

    /* Sort + Search row */
    .sm_admin__toolbar {
      display: flex;
      align-items: center;
      justify-content: flex-end;
      gap: 12px;
      margin-bottom: 24px;
    }

    .sm_admin__sort_select {
      appearance: none;
      -webkit-appearance: none;
      background: var(--white);
      border: 1px solid var(--gray-200);
      border-radius: 20px;
      padding: 9px 36px 9px 16px;
      font-size: 13px;
      font-family: 'Manrope', sans-serif;
      color: var(--text);
      cursor: pointer;
      background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='10' height='6'%3E%3Cpath fill='%23888' d='M5 6L0 0h10z'/%3E%3C/svg%3E");
      background-repeat: no-repeat;
      background-position: right 14px center;
    }

    .sm_admin__sort_select:focus { outline: none; }

    .sm_admin__search {
      display: flex;
      align-items: center;
      border: 1px solid var(--gray-200);
      border-radius: 20px;
      padding: 9px 16px;
      gap: 8px;
      width: 260px;
      background: var(--white);
    }

    .sm_admin__search input {
      background: transparent;
      border: none;
      outline: none;
      font-size: 13px;
      font-family: 'Manrope', sans-serif;
      color: var(--text);
      width: 100%;
    }

    .sm_admin__search input::placeholder { color: var(--gray-400); }

    .sm_admin__search img {
      width: 16px;
      height: 16px;
      opacity: 0.5;
    }

    /* Table */
    .sm_admin__table_wrap {
      width: 100%;
      overflow-x: auto;
    }

    .sm_admin__table {
      width: 100%;
      border-collapse: collapse;
    }

    .sm_admin__table thead tr {
      border-bottom: 2px solid var(--gray-200);
    }

    .sm_admin__table th {
      text-align: left;
      font-size: 13px;
      font-weight: 700;
      color: var(--text);
      padding: 12px 16px;
    }

    .sm_admin__table tbody tr {
      border-bottom: 1px solid var(--gray-100);
      transition: background 0.15s;
    }

    .sm_admin__table tbody tr:hover { background: var(--gray-100); }

    .sm_admin__table td {
      padding: 16px 16px;
      font-size: 13px;
      color: var(--gray-600);
      /* Taller rows to give poster more breathing room */
      vertical-align: middle;
    }

    /* Poster thumbnail — bigger than before so it's actually visible */
    .sm_admin__cover_thumb {
      width: 70px;
      height: 100px;
      border-radius: 8px;
      background: var(--gray-200);
      object-fit: cover;
      display: block;
    }

    /* Only Edit button — no delete */
    .sm_admin__btn_edit {
      background: var(--green);
      color: #fff;
      border: none;
      border-radius: 6px;
      padding: 8px 20px;
      font-size: 13px;
      font-family: 'Manrope', sans-serif;
      font-weight: 600;
      cursor: pointer;
      transition: background 0.2s;
      text-decoration: none;
      display: inline-block;
    }

    .sm_admin__btn_edit:hover { background: #2e9448; }

    /* Empty state message — shown when no data from backend yet */
    .sm_admin__empty_state {
      text-align: center;
      padding: 60px 20px;
      color: var(--gray-400);
      font-size: 14px;
    }

    /* Pagination */
    .sm_admin__pagination {
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 6px;
      margin-top: 40px;
    }

    .sm_admin__page_btn {
      width: 36px;
      height: 36px;
      border-radius: 50%;
      border: 1px solid var(--gray-200);
      background: var(--white);
      font-size: 13px;
      font-family: 'Manrope', sans-serif;
      font-weight: 600;
      color: var(--text);
      cursor: pointer;
      display: flex;
      align-items: center;
      justify-content: center;
      transition: background 0.15s, color 0.15s;
    }

    .sm_admin__page_btn:hover { background: var(--gray-100); }

    .sm_admin__page_btn.active {
      background: var(--text);
      color: var(--white);
      border-color: var(--text);
    }

    .sm_admin__page_arrow {
      width: 36px;
      height: 36px;
      border-radius: 50%;
      border: 1px solid var(--gray-200);
      background: var(--white);
      cursor: pointer;
      display: flex;
      align-items: center;
      justify-content: center;
      transition: background 0.15s;
    }

    .sm_admin__page_arrow:hover { background: var(--gray-100); }

    .sm_admin__page_arrow img {
      width: 14px;
      height: 14px;
      opacity: 0.6;
    }

  </style>
</head>
<body>


<!-- Sidebar -->
<aside class="sm_admin__sidebar">

  <div class="sm_admin__sidebar_logo">
    <a href="#">
      <img src="assets/images/LogoBlack.jpg" alt="SerieMeter"/>
    </a>
  </div>

  <nav class="sm_admin__sidebar_nav">

    <a href="${pageContext.request.contextPath}/AdminDashboard" class="sm_admin__nav_item">
      <img src="assets/icon/dashboard.svg" alt=""/>
      Dashboard
    </a>

    <a href="${pageContext.request.contextPath}/AdminDashboard" class="sm_admin__nav_item">
      <img src="assets/icon/clapper.svg" alt=""/>
      Content Management
    </a>

    <!-- Edit is active on this page -->
    <a href="${pageContext.request.contextPath}/Edit" class="sm_admin__nav_item active">
      <img src="assets/icon/edit.svg" alt=""/>
      Edit
    </a>

    <a href="#" class="sm_admin__nav_item">
      <img src="assets/icon/users.svg" alt=""/>
      Users
    </a>

  </nav>

  <div class="sm_admin__sidebar_logout">
    <a href="${pageContext.request.contextPath}/Login" class="sm_admin__logout_btn">
      <img src="assets/icon/login_icon.svg" alt=""/>
      Logout
    </a>
  </div>

</aside>


<!-- Main content -->
<div class="sm_admin__main">

  <!-- Top bar -->
  <div class="sm_admin__topbar">
    <span class="sm_admin__topbar_title">Edit medias</span>

    <!-- User info — will be replaced by session data in backend -->
    <div class="sm_admin__topbar_user">
      <div class="sm_admin__topbar_userinfo">
        <%-- Backend: replace with session attribute e.g. ${sessionScope.user.firstName} --%>
        <div class="sm_admin__topbar_name">Admin</div>
        <div class="sm_admin__topbar_email">admin@seriemeter.com</div>
      </div>
      <div class="sm_admin__topbar_avatar">
        <%-- Backend: replace src with ${sessionScope.user.profileImage} --%>
        <img src="assets/images/profile_image.png" alt="User" onerror="this.style.display='none'"/>
      </div>
    </div>
  </div>


  <!-- Page content -->
  <div class="sm_admin__content">

    <div class="sm_admin__page_heading">
      <h1>Edit <span>Medias</span></h1>
      <p>Update media details here</p>
    </div>

    <!-- Sort + Search toolbar -->
    <div class="sm_admin__toolbar">
      <select class="sm_admin__sort_select" onchange="sortTable(this.value)">
        <option value="date">Sort by Date</option>
        <option value="name">Sort by Name</option>
        <option value="category">Sort by Category</option>
      </select>

      <div class="sm_admin__search">
        <input type="text" placeholder="Search for medias" id="searchInput" onkeyup="filterTable()"/>
        <img src="assets/icon/search.svg" alt="Search"/>
      </div>
    </div>

    <!-- Table -->
    <div class="sm_admin__table_wrap">
      <table class="sm_admin__table" id="mediaTable">
        <thead>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Category</th>
            <th>Genre</th>
            <th>Added Date</th>
            <th>Cover Image</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody id="tableBody">

         
        </tbody>
      </table>

      <%-- Show this message when the table has no rows --%>
      <div class="sm_admin__empty_state" id="emptyState">
        No media entries yet. Add media from Content Management.
      </div>

    </div>


    <!-- Pagination -->
    <div class="sm_admin__pagination">
      <button class="sm_admin__page_arrow" onclick="changePage(-1)">
        <img src="assets/icon/arrow-left.svg" alt="Previous"/>
      </button>

      <button class="sm_admin__page_btn active" onclick="setPage(1)">1</button>
      <button class="sm_admin__page_btn" onclick="setPage(2)">2</button>
      <button class="sm_admin__page_btn" onclick="setPage(3)">3</button>

      <button class="sm_admin__page_arrow" onclick="changePage(1)">
        <img src="assets/icon/arrow-right.svg" alt="Next"/>
      </button>
    </div>

  </div>
</div>


<script>

  /* How many rows to show per page */
  var rowsPerPage = 4;
  var currentPage = 1;

  /* Run on load — sets up pagination based on actual rows */
  window.onload = function() {
    updateDisplay();
    checkEmpty();
  };

  /* Hide/show empty state message */
  function checkEmpty() {
    var rows = document.querySelectorAll('#tableBody tr');
    var emptyState = document.getElementById('emptyState');
    if (rows.length === 0) {
      emptyState.style.display = 'block';
    } else {
      emptyState.style.display = 'none';
    }
  }

  /* Shows only the rows for the current page, hides the rest */
  function updateDisplay() {
    var rows = document.querySelectorAll('#tableBody tr');
    var start = (currentPage - 1) * rowsPerPage;  /* e.g. page 1 starts at 0 */
    var end   = start + rowsPerPage;               /* e.g. page 1 ends at 4 */

    rows.forEach(function(row, index) {
      /* Show the row if its index falls in the current page range */
      if (index >= start && index < end) {
        row.style.display = '';
      } else {
        row.style.display = 'none';
      }
    });

    /* Rebuild how many page buttons we need */
    rebuildPagination(rows.length);
  }

  /* Rebuild the page number buttons based on total rows */
  function rebuildPagination(totalRows) {
    var totalPages = Math.ceil(totalRows / rowsPerPage);
    if (totalPages < 1) totalPages = 1;

    /* Get the pagination container */
    var pagination = document.querySelector('.sm_admin__pagination');

    /* Save the arrow buttons */
    var prevArrow = pagination.children[0];
    var nextArrow = pagination.children[pagination.children.length - 1];

    /* Remove all old page number buttons */
    var oldBtns = pagination.querySelectorAll('.sm_admin__page_btn');
    oldBtns.forEach(function(btn) { btn.remove(); });

    /* Add fresh page buttons */
    for (var i = 1; i <= totalPages; i++) {
      var btn = document.createElement('button');
      btn.className = 'sm_admin__page_btn' + (i === currentPage ? ' active' : '');
      btn.textContent = i;
      btn.setAttribute('onclick', 'setPage(' + i + ')');
      /* Insert before the next arrow */
      pagination.insertBefore(btn, nextArrow);
    }
  }

  /* Go to a specific page number */
  function setPage(num) {
    currentPage = num;
    updateDisplay();
    updateActiveBtn();
  }

  /* Prev (-1) or Next (+1) */
  function changePage(direction) {
    var rows = document.querySelectorAll('#tableBody tr');
    var totalPages = Math.ceil(rows.length / rowsPerPage);
    var newPage = currentPage + direction;
    if (newPage < 1 || newPage > totalPages) return;
    currentPage = newPage;
    updateDisplay();
    updateActiveBtn();
  }

  /* Highlight the active page button */
  function updateActiveBtn() {
    var pageBtns = document.querySelectorAll('.sm_admin__page_btn');
    pageBtns.forEach(function(btn) {
      btn.classList.remove('active');
      if (parseInt(btn.textContent) === currentPage) {
        btn.classList.add('active');
      }
    });
  }

  /* Live search — hides rows that don't match what's typed */
  function filterTable() {
    var searchText = document.getElementById('searchInput').value.toLowerCase();
    var rows = document.querySelectorAll('#tableBody tr');

    rows.forEach(function(row) {
      var rowText = row.textContent.toLowerCase();
      row.style.display = rowText.includes(searchText) ? '' : 'none';
    });
  }

</script>

</body>
</html>
    