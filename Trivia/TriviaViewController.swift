import UIKit

class TriviaViewController: UIViewController {
    
    // MARK: - UI Properties
    
    private let questionLabel = UILabel()
    private let questionCountLabel = UILabel()
    private let scoreLabel = UILabel()
    private var answerButtons = [UIButton]()
    private let stackView = UIStackView()
    private let restartButton = UIButton(type: .system)
    
    // MARK: - Game Properties
    
    private var questions: [TriviaQuestion] = []
    private var currentQuestionIndex = 0
    private var score = 0
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupQuestions()
        setupUI()
        updateUI()
    }
    
    // MARK: - Game Setup
    
    private func setupQuestions() {
        questions = [
            TriviaQuestion(
                question: "What is the capital of France?",
                answers: ["London", "Berlin", "Paris", "Madrid"],
                correctAnswerIndex: 2
            ),
            TriviaQuestion(
                question: "Which planet is known as the Red Planet?",
                answers: ["Earth", "Mars", "Venus", "Jupiter"],
                correctAnswerIndex: 1
            ),
            TriviaQuestion(
                question: "What is the largest mammal in the world?",
                answers: ["Elephant", "Giraffe", "Blue Whale", "Polar Bear"],
                correctAnswerIndex: 2
            ),
            TriviaQuestion(
                question: "Which element has the chemical symbol 'O'?",
                answers: ["Osmium", "Oxygen", "Oganesson", "Olivine"],
                correctAnswerIndex: 1
            ),
            TriviaQuestion(
                question: "Who painted the Mona Lisa?",
                answers: ["Vincent van Gogh", "Leonardo da Vinci", "Pablo Picasso", "Michelangelo"],
                correctAnswerIndex: 1
            )
        ]
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        // Question count label setup
        questionCountLabel.translatesAutoresizingMaskIntoConstraints = false
        questionCountLabel.textAlignment = .center
        questionCountLabel.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(questionCountLabel)
        
        // Score label setup
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.textAlignment = .center
        scoreLabel.font = UIFont.systemFont(ofSize: 18)
        scoreLabel.isHidden = true
        view.addSubview(scoreLabel)
        
        // Question label setup
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.textAlignment = .center
        questionLabel.font = UIFont.boldSystemFont(ofSize: 24)
        questionLabel.numberOfLines = 0
        view.addSubview(questionLabel)
        
        // Stack view for answer buttons
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        
        // Create answer buttons
        for i in 0..<4 {
            let button = UIButton(type: .system)
            button.tag = i
            button.backgroundColor = .systemBlue
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            button.layer.cornerRadius = 8
            button.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
            answerButtons.append(button)
            stackView.addArrangedSubview(button)
        }
        
        // Restart button setup
        restartButton.translatesAutoresizingMaskIntoConstraints = false
        restartButton.setTitle("Restart Game", for: .normal)
        restartButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        restartButton.addTarget(self, action: #selector(restartGame), for: .touchUpInside)
        restartButton.isHidden = true
        view.addSubview(restartButton)
        
        // Setup constraints
        NSLayoutConstraint.activate([
            questionCountLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            questionCountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            questionCountLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            scoreLabel.topAnchor.constraint(equalTo: questionCountLabel.bottomAnchor, constant: 8),
            scoreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            scoreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            questionLabel.topAnchor.constraint(equalTo: questionCountLabel.bottomAnchor, constant: 40),
            questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            stackView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 240),
            
            restartButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 40),
            restartButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            restartButton.heightAnchor.constraint(equalToConstant: 44),
            restartButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    // MARK: - UI Updates
    
    private func updateUI() {
        if currentQuestionIndex < questions.count {
            let currentQuestion = questions[currentQuestionIndex]
            
            questionCountLabel.text = "Question \(currentQuestionIndex + 1) of \(questions.count)"
            questionLabel.text = currentQuestion.question
            
            for (index, button) in answerButtons.enumerated() {
                button.setTitle(currentQuestion.answers[index], for: .normal)
            }
            
            restartButton.isHidden = true
            scoreLabel.isHidden = true
            
            for button in answerButtons {
                button.isHidden = false
            }
        } else {
            // Game finished
            questionCountLabel.text = "Game Over"
            questionLabel.text = "You scored \(score) out of \(questions.count)!"
            scoreLabel.text = "Final Score: \(score)/\(questions.count)"
            scoreLabel.isHidden = false
            restartButton.isHidden = false
            
            for button in answerButtons {
                button.isHidden = true
            }
        }
    }
    
    // MARK: - Actions
    
    @objc private func answerButtonTapped(_ sender: UIButton) {
        let currentQuestion = questions[currentQuestionIndex]
        
        if sender.tag == currentQuestion.correctAnswerIndex {
            score += 1
        }
        
        currentQuestionIndex += 1
        updateUI()
    }
    
    @objc private func restartGame() {
        currentQuestionIndex = 0
        score = 0
        updateUI()
    }
} 