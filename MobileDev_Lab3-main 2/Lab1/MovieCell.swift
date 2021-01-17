//
//  MovieCell.swift
//  Lab1
//


import UIKit

class MovieCell: UITableViewCell {
     
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieYearLabel: UILabel!
    @IBOutlet weak var movieTypeLabel: UILabel!
    
    func setMovie(movie: Movie) {
        
        movieNameLabel.text = movie.Title
        // when there is no poster or type or year (which can happen)
        if movie.Poster.isEmpty {
            movieImageView.image = UIImage(named: "notFound.jpg")
        }
        else {
            movieImageView.image = UIImage(named: movie.Poster)
        }
        if movie.Year.isEmpty {
            movieYearLabel.text = "Year unknown"
        }
        else {
            movieYearLabel.text = movie.Year
        }
        if movie.Type.isEmpty {
            movieTypeLabel.text = "Type unknown"
        }
        else {
            movieTypeLabel.text = movie.Type
        }
    }
    
}
