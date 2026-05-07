package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Movie;

public class MovieDAO extends DAO {

    public MovieDAO() {
        super();
    }

    public List<Movie> getShowingMovies() {
        List<Movie> movies = new ArrayList<>();
        String query = "SELECT * FROM tblMovie";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Movie movie = new Movie();
                movie.setId(rs.getInt("id"));
                movie.setName(rs.getString("name"));
                movie.setGenre(rs.getString("genre"));
                movie.setDuration(rs.getFloat("duration"));
                movie.setDate(rs.getDate("releaseDate"));
                movie.setDirector(rs.getString("director"));
                movie.setCast(rs.getString("cast"));
                movie.setLanguage(rs.getString("language"));
                movie.setRated(rs.getFloat("rated"));
                movie.setDescription(rs.getString("description"));
                movies.add(movie);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movies;
    }

    public boolean addMovieInformation(Movie movie) {
        boolean result = false;
        String query = "INSERT INTO tblMovie (name, genre, duration, releaseDate, director, cast, language, rated, description) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, movie.getName());
            ps.setString(2, movie.getGenre());
            ps.setFloat(3, movie.getDuration());
            ps.setDate(4, new java.sql.Date(movie.getDate().getTime()));
            ps.setString(5, movie.getDirector());
            ps.setString(6, movie.getCast());
            ps.setString(7, movie.getLanguage());
            ps.setFloat(8, movie.getRated());
            ps.setString(9, movie.getDescription());
            
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
