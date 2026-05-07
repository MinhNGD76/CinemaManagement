package model;

import java.util.Date;

public class Movie {
    private int id;
    private String name;
    private String genre;
    private float duration;
    private Date date;
    private String director;
    private String cast;
    private String language;
    private float rated;
    private String description;

    public Movie() {}

    public Movie(int id, String name, String genre, float duration, Date date, String director, String cast, String language, float rated, String description) {
        this.id = id;
        this.name = name;
        this.genre = genre;
        this.duration = duration;
        this.date = date;
        this.director = director;
        this.cast = cast;
        this.language = language;
        this.rated = rated;
        this.description = description;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    
    public String getGenre() { return genre; }
    public void setGenre(String genre) { this.genre = genre; }
    
    public float getDuration() { return duration; }
    public void setDuration(float duration) { this.duration = duration; }
    
    public Date getDate() { return date; }
    public void setDate(Date date) { this.date = date; }
    
    public String getDirector() { return director; }
    public void setDirector(String director) { this.director = director; }
    
    public String getCast() { return cast; }
    public void setCast(String cast) { this.cast = cast; }
    
    public String getLanguage() { return language; }
    public void setLanguage(String language) { this.language = language; }
    
    public float getRated() { return rated; }
    public void setRated(float rated) { this.rated = rated; }
    
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
}
