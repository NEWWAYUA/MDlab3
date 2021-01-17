//
//  ViewController.swift
//  Lab1
//


import UIKit

class MoviesListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movies: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        movies = loadMovieData()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func loadMovieData() -> [Movie]{
        guard let path = Bundle.main.path(forResource: "MoviesList", ofType: "txt") else { return [] }
        let url = URL(fileURLWithPath: path)
        // array of Movie structures
        var movies = [Movie]()
        do {
            let data = try Data(contentsOf: url)
            let response = try JSONDecoder().decode(Response.self, from: data)
            movies = response.Search
            
        } catch {
            print(error)
        }
        return movies
    }
}

extension MoviesListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = movies[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        
        cell.setMovie(movie: movie)
        
        return cell
    }
}
