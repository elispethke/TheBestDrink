//
//  DetailViewController.swift
//  TheBestDrink
//
//  Created by Elisangela Pethke on 16.06.24.
//

import UIKit

class DetailViewController: UIViewController {
    
    var drink: Drink?
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Drink Surtise"
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    let alcoholLabel: UILabel = {
        let label = UILabel()
        label.text = "Alcohol:"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let alcoholValueLabel: UILabel = {
        let label = UILabel()
        label.text = "Yes"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let glassTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "Glass Type:"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let glassTypeValueLabel: UILabel = {
        let label = UILabel()
        label.text = "Red Solo Cup"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        return activityIndicator
    }()
    
    let ingredientsLabel: UILabel = {
        let label = UILabel()
        label.text = "Ingredients"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    let ingredientsTextView: UITextView = {
        let textView = UITextView()
        textView.text = "3/4-1 cup vodka\n2 cups chilled tomato juice\n1/2 teaspoon Worcestershire sauce\n6 drops Tabasco Sauce (or other hot pepper sauce)\na pinch of salt and black pepper\n1/2 lemon, sliced\n4 stalks celery a bit longer than the height of the glass"
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    let recipeLabel: UILabel = {
        let label = UILabel()
        label.text = "Recipe"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    let recipeTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Take a sunrise, sprinkle it with dew, cover it with chocolate and a miracle or two."
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupScrollView()
        setupConstraints()
        loadImage()
    }
    
    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(imageView)
        contentView.addSubview(alcoholLabel)
        contentView.addSubview(alcoholValueLabel)
        contentView.addSubview(glassTypeLabel)
        contentView.addSubview(glassTypeValueLabel)
        contentView.addSubview(activityIndicator)
        contentView.addSubview(ingredientsLabel)
        contentView.addSubview(ingredientsTextView)
        contentView.addSubview(recipeLabel)
        contentView.addSubview(recipeTextView)
    }
    
    func setupConstraints() {
        let margin: CGFloat = 20
        let horizontalPadding: CGFloat = 93
        let verticalSpacing: CGFloat = 18
        let additionalSpacing: CGFloat = 47
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        alcoholLabel.translatesAutoresizingMaskIntoConstraints = false
        alcoholValueLabel.translatesAutoresizingMaskIntoConstraints = false
        glassTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        glassTypeValueLabel.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        ingredientsLabel.translatesAutoresizingMaskIntoConstraints = false
        ingredientsTextView.translatesAutoresizingMaskIntoConstraints = false
        recipeLabel.translatesAutoresizingMaskIntoConstraints = false
        recipeTextView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: margin),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: verticalSpacing),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: horizontalPadding),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -horizontalPadding),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.75),
            
            alcoholLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: verticalSpacing),
            alcoholLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            
            alcoholValueLabel.topAnchor.constraint(equalTo: alcoholLabel.bottomAnchor, constant: verticalSpacing / 2),
            alcoholValueLabel.leadingAnchor.constraint(equalTo: alcoholLabel.leadingAnchor),
            
            glassTypeLabel.topAnchor.constraint(equalTo: alcoholLabel.topAnchor),
            glassTypeLabel.leadingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: margin),
            
            glassTypeValueLabel.topAnchor.constraint(equalTo: glassTypeLabel.bottomAnchor, constant: verticalSpacing / 2),
            glassTypeValueLabel.leadingAnchor.constraint(equalTo: glassTypeLabel.leadingAnchor),
            
            activityIndicator.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: margin),
            activityIndicator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            ingredientsLabel.topAnchor.constraint(equalTo: alcoholValueLabel.bottomAnchor, constant: additionalSpacing),
            ingredientsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
            ingredientsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin),
            
            ingredientsTextView.topAnchor.constraint(equalTo: ingredientsLabel.bottomAnchor, constant: verticalSpacing),
            ingredientsTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
            ingredientsTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin),
            
            recipeLabel.topAnchor.constraint(equalTo: ingredientsTextView.bottomAnchor, constant: additionalSpacing),
            recipeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
            recipeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin),
            
            recipeTextView.topAnchor.constraint(equalTo: recipeLabel.bottomAnchor, constant: verticalSpacing),
            recipeTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
            recipeTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin),
            recipeTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -margin)
        ])
    }
    
    func loadImage() {
        guard let drink = drink, let imageUrlString = drink.strDrinkThumb, let url = URL(string: imageUrlString) else {
            return
        }
        
        // Start activity indicator while loading image
        activityIndicator.startAnimating()
        
        // Fetch image data
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            guard error == nil else {
                // Handle error if needed
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                }
                return
            }
            
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.imageView.image = image
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        
        task.resume()
    }
}
