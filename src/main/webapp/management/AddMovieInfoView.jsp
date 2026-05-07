<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Movie" %>
<%@ page import="dao.MovieDAO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    request.setCharacterEncoding("UTF-8");
    
    // Check if the request is a form submission
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String name = request.getParameter("name");
        String genre = request.getParameter("genre");
        String director = request.getParameter("director");
        String cast = request.getParameter("cast");
        String durationStr = request.getParameter("duration");
        String dateStr = request.getParameter("date");
        String language = request.getParameter("language");
        String ratedStr = request.getParameter("rated");
        String description = request.getParameter("description");

        if (name != null && genre != null && dateStr != null) {
            try {
                float duration = Float.parseFloat(durationStr);
                float rated = Float.parseFloat(ratedStr);
                
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                Date releaseDate = formatter.parse(dateStr);
                
                Movie movie = new Movie();
                movie.setName(name);
                movie.setGenre(genre);
                movie.setDirector(director);
                movie.setCast(cast);
                movie.setDuration(duration);
                movie.setDate(releaseDate);
                movie.setLanguage(language);
                movie.setRated(rated);
                movie.setDescription(description);
                
                MovieDAO movieDAO = new MovieDAO();
                boolean isAdded = movieDAO.addMovieInformation(movie);
                
                if (isAdded) {
                    out.println("<script>alert('Movie added successfully'); window.location.href='MSMainView.jsp';</script>");
                    return;
                } else {
                    out.println("<script>alert('Failed to add movie. Please try again.'); window.history.back();</script>");
                    return;
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<script>alert('Failed to add movie. Please check your inputs.'); window.history.back();</script>");
                return;
            }
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Cinema</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f9;
        margin: 0;
        padding: 20px;
        display: flex;
        justify-content: center;
    }
    .form-container {
        background-color: #fff;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        width: 100%;
        max-width: 500px;
    }
    .form-container h2 {
        text-align: center;
        color: #333;
        margin-top: 0;
    }
    .form-group {
        margin-bottom: 15px;
    }
    .form-group label {
        display: block;
        margin-bottom: 5px;
        color: #555;
        font-weight: bold;
    }
    .form-group input, 
    .form-group select, 
    .form-group textarea {
        width: 100%;
        padding: 10px;
        box-sizing: border-box;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 14px;
    }
    .form-group textarea {
        resize: vertical;
        height: 80px;
    }
    .button-group {
        display: flex;
        justify-content: space-between;
        margin-top: 20px;
    }
    button {
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
    }
    .btn-submit {
        background-color: #28a745;
        color: white;
        flex: 1;
        margin-right: 10px;
    }
    .btn-submit:hover {
        background-color: #218838;
    }
    .btn-cancel {
        background-color: #dc3545;
        color: white;
        flex: 1;
        margin-left: 10px;
    }
    .btn-cancel:hover {
        background-color: #c82333;
    }
    
    /* Notification styling */
    .notification {
        visibility: hidden;
        min-width: 300px;
        background-color: #28a745;
        color: white;
        text-align: center;
        border-radius: 4px;
        padding: 15px;
        position: fixed;
        z-index: 1000;
        left: 50%;
        bottom: 20px;
        font-size: 16px;
        transform: translateX(-50%);
        box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        opacity: 0;
        transition: opacity 0.5s, bottom 0.5s;
    }
    
    .notification.show {
        visibility: visible;
        opacity: 1;
        bottom: 40px;
    }
    
    /* Multi-select styling */
    .multi-select {
        position: relative;
        width: 100%;
    }
    .tags-input {
        min-height: 38px;
        border: 1px solid #ccc;
        border-radius: 4px;
        padding: 5px;
        display: flex;
        flex-wrap: wrap;
        gap: 5px;
        cursor: pointer;
        background-color: #fff;
        align-items: center;
    }
    .tags-container {
        display: flex;
        flex-wrap: wrap;
        gap: 5px;
    }
    .placeholder-text {
        color: #999;
        font-size: 14px;
        padding-left: 5px;
    }
    .tag {
        background-color: transparent;
        color: #333;
        border: 1px solid #ccc;
        border-radius: 3px;
        padding: 4px 8px;
        display: flex;
        align-items: center;
        font-size: 13px;
    }
    .tag .remove-tag {
        margin-left: 6px;
        cursor: pointer;
        font-weight: bold;
    }
    .dropdown-options {
        position: absolute;
        top: 100%;
        left: 0;
        right: 0;
        background: white;
        border: 1px solid #ccc;
        border-radius: 0 0 4px 4px;
        max-height: 150px;
        overflow-y: auto;
        z-index: 1000;
        display: none;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }
    .dropdown-options.show {
        display: block;
    }
    .dropdown-option {
        padding: 8px 10px;
        cursor: pointer;
        font-size: 14px;
    }
    .dropdown-option:hover {
        background-color: #f1f1f1;
    }
</style>
<script>
    const selections = {
        director: [],
        cast: [],
        language: []
    };

    function toggleDropdown(field) {
        document.querySelectorAll('.dropdown-options').forEach(el => {
            if (el.id !== field + '-dropdown') el.classList.remove('show');
        });
        document.getElementById(field + '-dropdown').classList.toggle('show');
    }

    function addTag(field, value) {
        if (!selections[field].includes(value)) {
            selections[field].push(value);
            renderTags(field);
        }
        document.getElementById(field + '-dropdown').classList.remove('show');
    }

    function removeTag(field, value, event) {
        event.stopPropagation();
        selections[field] = selections[field].filter(item => item !== value);
        renderTags(field);
    }

    function renderTags(field) {
        const container = document.getElementById(field + '-tags');
        const placeholder = document.getElementById(field + '-placeholder');
        container.innerHTML = '';
        
        if (selections[field].length > 0) {
            if (placeholder) placeholder.style.display = 'none';
        } else {
            if (placeholder) placeholder.style.display = 'block';
        }
        
        selections[field].forEach(val => {
            const tag = document.createElement('div');
            tag.className = 'tag';
            tag.innerHTML = val + '<span class="remove-tag" onclick="removeTag(\'' + field + '\', \'' + val + '\', event)">×</span>';
            container.appendChild(tag);
        });
        
        document.getElementById(field + '-hidden').value = selections[field].join(', ');
    }

    document.addEventListener('click', function(e) {
        if (!e.target.closest('.multi-select')) {
            document.querySelectorAll('.dropdown-options').forEach(el => el.classList.remove('show'));
        }
    });
</script>
</head>
<body>
    <div class="form-container">
        <h2>Add New Movie</h2>
        
        <form action="AddMovieInfoView.jsp" method="POST">
            <div class="form-group">
                <label for="name">Movie Name</label>
                <input type="text" id="name" name="name" placeholder="Enter movie name" required>
            </div>
            
            <div class="form-group">
                <label for="genre">Genre</label>
                <select id="genre" name="genre" required>
                    <option value="">Select Genre</option>
                    <option value="Action">Action</option>
                    <option value="Comedy">Comedy</option>
                    <option value="Drama">Drama</option>
                    <option value="Horror">Horror</option>
                    <option value="Sci-Fi">Sci-Fi</option>
                    <option value="Romance">Romance</option>
                </select>
            </div>

            <div class="form-group">
                <label>Director</label>
                <div class="multi-select">
                    <div class="tags-input" onclick="toggleDropdown('director')">
                        <span class="placeholder-text" id="director-placeholder">Select directors...</span>
                        <div class="tags-container" id="director-tags"></div>
                    </div>
                    <div class="dropdown-options" id="director-dropdown">
                        <div class="dropdown-option" onclick="addTag('director', 'Christopher Nolan')">Christopher Nolan</div>
                        <div class="dropdown-option" onclick="addTag('director', 'Steven Spielberg')">Steven Spielberg</div>
                        <div class="dropdown-option" onclick="addTag('director', 'James Cameron')">James Cameron</div>
                        <div class="dropdown-option" onclick="addTag('director', 'Quentin Tarantino')">Quentin Tarantino</div>
                        <div class="dropdown-option" onclick="addTag('director', 'Martin Scorsese')">Martin Scorsese</div>
                    </div>
                </div>
                <input type="text" name="director" id="director-hidden" required style="opacity:0; width:0; height:0; position:absolute;">
            </div>

            <div class="form-group">
                <label>Cast</label>
                <div class="multi-select">
                    <div class="tags-input" onclick="toggleDropdown('cast')">
                        <span class="placeholder-text" id="cast-placeholder">Select cast members...</span>
                        <div class="tags-container" id="cast-tags"></div>
                    </div>
                    <div class="dropdown-options" id="cast-dropdown">
                        <div class="dropdown-option" onclick="addTag('cast', 'Leonardo DiCaprio')">Leonardo DiCaprio</div>
                        <div class="dropdown-option" onclick="addTag('cast', 'Brad Pitt')">Brad Pitt</div>
                        <div class="dropdown-option" onclick="addTag('cast', 'Tom Cruise')">Tom Cruise</div>
                        <div class="dropdown-option" onclick="addTag('cast', 'Morgan Freeman')">Morgan Freeman</div>
                        <div class="dropdown-option" onclick="addTag('cast', 'Cillian Murphy')">Cillian Murphy</div>
                    </div>
                </div>
                <input type="text" name="cast" id="cast-hidden" required style="opacity:0; width:0; height:0; position:absolute;">
            </div>

            <div class="form-group">
                <label for="duration">Duration (minutes)</label>
                <input type="number" id="duration" name="duration" placeholder="120" required min="1">
            </div>

            <div class="form-group">
                <label for="date">Release Date</label>
                <input type="date" id="date" name="date" required>
            </div>

            <div class="form-group">
                <label>Language</label>
                <div class="multi-select">
                    <div class="tags-input" onclick="toggleDropdown('language')">
                        <span class="placeholder-text" id="language-placeholder">Select languages...</span>
                        <div class="tags-container" id="language-tags"></div>
                    </div>
                    <div class="dropdown-options" id="language-dropdown">
                        <div class="dropdown-option" onclick="addTag('language', 'English')">English</div>
                        <div class="dropdown-option" onclick="addTag('language', 'Vietnamese')">Vietnamese</div>
                        <div class="dropdown-option" onclick="addTag('language', 'Spanish')">Spanish</div>
                        <div class="dropdown-option" onclick="addTag('language', 'Korean')">Korean</div>
                        <div class="dropdown-option" onclick="addTag('language', 'Japanese')">Japanese</div>
                    </div>
                </div>
                <input type="text" name="language" id="language-hidden" required style="opacity:0; width:0; height:0; position:absolute;">
            </div>

            <div class="form-group">
                <label for="rated">Rating</label>
                <input type="number" step="0.1" id="rated" name="rated" placeholder="e.g., 8.5" required min="0" max="10">
            </div>

            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" placeholder="Short description of the movie..."></textarea>
            </div>

            <div class="button-group">
                <button type="submit" class="btn-submit">Save</button>
                <button type="button" class="btn-cancel" onclick="window.location.href='MovieInfoManageView.jsp'">Back</button>
            </div>
        </form>
    </div>
</body>
</html>
