//
//  ViewController.swift
//  FindMeAMovie
//
//  Created by Shivam Kapur on 02/03/17.
//  Copyright © 2017 ShivamKapoor. All rights reserved.
//

//
//Spec:
//App should accept a movie name from the user.
//Based on the name entered, app should show following details of the movie: Title, Genre, Release date, Plot (short version) and rating.
//
//Optional:
//1. Accept multiple movie names from the user and display all search results alongwith the details.
//2. Allow user to specify a type (Movie or Serial) and then yield results accordingly.
//
//


import UIKit

class HomeController: UIViewController, UISearchBarDelegate {
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.barStyle = UIBarStyle.default
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Enter a movie name to begin with. Eg: Fences"
        searchBar.delegate = self
        searchBar.enablesReturnKeyAutomatically = false
        searchBar.backgroundColor = .clear
        return searchBar
    }()
    
    var searchText: String {
        get {
            if let text = searchBar.text {
                return text
            }   else {
                return ""
            }
        }
        
        set {
            searchBar.text = newValue
        }
    }
    
    private var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        //        imageView.backgroundColor = .yellow
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var moviePosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        //        imageView.backgroundColor = .black
        return imageView
    }()
    
    private var movieNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Light", size: 18)
        label.textAlignment = .center
        return label
    }()
    
    private var moviePlotLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "Helvetica", size: 15)
        label.textAlignment = .center
        return label
    }()
    
    private var genreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold", size: 14)
        label.textAlignment = .center
        return label
    }()
    
    private var ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = .center
        return label
    }()
    
    private var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 14)
        label.textAlignment = .center
        return label
    }()
    
    override func loadView() {
        super.loadView()
        
        setupView()
        
        
    }
    
    func setupView() {
        view.backgroundColor = UIColor.white
        
        view.addSubview(withView: backgroundImageView)
        view.addSubview(withView: searchBar)
        view.addSubview(withView: movieNameLabel)
        view.addSubview(withView: moviePosterImageView)
        view.addSubview(withView: genreLabel)
        view.addSubview(withView: releaseDateLabel)
        view.addSubview(withView: ratingLabel)
        view.addSubview(withView: moviePlotLabel)
        
        
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundImageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        searchBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        searchBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        movieNameLabel.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 8).isActive = true
        movieNameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        movieNameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        movieNameLabel.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
        moviePosterImageView.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 12).isActive = true
        moviePosterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        moviePosterImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        moviePosterImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        genreLabel.topAnchor.constraint(equalTo: moviePosterImageView.bottomAnchor, constant: 12).isActive = true
        genreLabel.leftAnchor.constraint(equalTo: movieNameLabel.leftAnchor).isActive = true
        genreLabel.rightAnchor.constraint(equalTo: movieNameLabel.rightAnchor).isActive = true
        genreLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        releaseDateLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 12).isActive = true
        releaseDateLabel.leftAnchor.constraint(equalTo: movieNameLabel.leftAnchor).isActive = true
        releaseDateLabel.rightAnchor.constraint(equalTo: movieNameLabel.rightAnchor).isActive = true
        releaseDateLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        ratingLabel.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 8).isActive = true
        ratingLabel.leftAnchor.constraint(equalTo: movieNameLabel.leftAnchor).isActive = true
        ratingLabel.rightAnchor.constraint(equalTo: movieNameLabel.rightAnchor).isActive = true
        ratingLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        moviePlotLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 12).isActive = true
        moviePlotLabel.leftAnchor.constraint(equalTo: movieNameLabel.leftAnchor).isActive = true
        moviePlotLabel.rightAnchor.constraint(equalTo: movieNameLabel.rightAnchor).isActive = true
        moviePlotLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    //
    //    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    //        searchBar.showsCancelButton = false
    //    }
    //
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        endEditing()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        endEditing()
        if searchText != "" {
            Movie.getMovieObject(name: searchText, completionHandler: { [weak weakSelf = self] (movie) in
                if let movie = movie {
                    DispatchQueue.main.async {
                        weakSelf?.setupUI(movie: movie)
                        
                    }
                }   else {
                    weakSelf?.showAlert(title: "Movie not found.", message: "Please make sure that you have entered the movie name correctly and try again.")
                    weakSelf?.searchText = ""
                }
            })
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing()
    }
    
    private func endEditing() {
        searchBar.endEditing(true)
        searchBar.showsCancelButton = false
    }
    
    func blurBackgroundImage(_ image: UIImage) {
        // Make a frame the size of the current view
        let frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        // Make an image view using that frame
        let imageView = UIImageView(frame: frame)
        
        // Push the received image into the new image view and scale it
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        
        // Create a blur effect view and blur effect
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = frame
        
        // set up a layer with 30% alpha to dull the blur colors
        let transparentWhiteView = UIView(frame: frame)
        transparentWhiteView.backgroundColor = UIColor(white: 1.0, alpha: 0.30)
        
        // Add views to our view with an Array
        var viewsArray = [imageView, blurEffectView, transparentWhiteView]
        
        // use a half closed range
        for index in 0..<viewsArray.count {
            // remove any old background views with tags
            if let oldView = view.viewWithTag(index + 1) {
                oldView.removeFromSuperview()
            }
            
            // insert the view into
            let viewToInsert = viewsArray[index]
            viewToInsert.alpha = 0

            self.view.insertSubview(viewToInsert, at: index + 1)
            
            UIView.animate(withDuration: 0.5, animations: {
                viewToInsert.alpha = 1
            })
            
            // add the tag in order to remove for the next time
            viewToInsert.tag = index + 1
        }
    }
    
    private func getImage(fromURL urlString: String) -> UIImage? {
        let url = URL(string: urlString)!
        do {
            let data = try Data(contentsOf: url)
            let imageToReturn = UIImage(data: data)
            if let image = imageToReturn {
                return image
            }   else {
                return nil
            }
        }   catch {
            
        }
        
        return nil
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(dismissAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    private func setupUI(movie: Movie) {
        movieNameLabel.text = movie.movieName
        moviePlotLabel.text = movie.plotInfo
        releaseDateLabel.text = "Release date: \(movie.releaseDate)"
        genreLabel.text = "Genre: \(movie.genre)"
        ratingLabel.text = "Rating: \(movie.rating)"
        
        let image = getImage(fromURL: movie.imageURL)
        if let image = image {
            UIView.transition(with: moviePosterImageView, duration: 0.75, options: .transitionCrossDissolve, animations: {
                self.moviePosterImageView.image = image
            }, completion: { (success) in
                
            })
            blurBackgroundImage(image)
        }
    }
}

