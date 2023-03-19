
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var score = 0
    var currentQuestionIndex = 0
    var questions = [("下列哪一個字代表盆地？", "湖", "崁"), ("哪一個字代表沙丘？", "崙", "壢"),
        ("最早大員指的範圍是？", "安平", "中部"),
                     ("烏來在泰雅族語的意思？", "溫泉", "吉祥"),
                     ("哪一地名為閩南聚落？", "新厝", "新屋"),
                     ("哪一地名源於日語？", "汐止", "三貂角"),
                     ("哪一地名源於日語？", "松山", "新竹"),
                     ("哪一地名與原住民有關？", "花蓮", "苗栗"),
                     ("哪一地名源於皇帝賜名？", "高雄", "嘉義"),
                     ("哪一地名源於方位？", "臺中", "金門")]
    var answer = [("湖"),("崙"),("安平"),("溫泉"),("新厝"),("汐止"),("松山"),("苗栗"),("嘉義"),("臺中"),]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nextQuestion()
    }
    
    @IBAction func button_Tapped(_ sender: UIButton) {
        let selectedAnswer = sender.titleLabel!.text!
        let correctAnswer = answer[currentQuestionIndex]
        
        if selectedAnswer == correctAnswer {
            score += 10
            scoreLabel.text = "目前成績"+" \(score)"
            sender.backgroundColor = UIColor.green
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    sender.backgroundColor = UIColor.clear
                }
            
        } else {
            scoreLabel.text = "目前成績"+"\(score)"
            sender.backgroundColor = UIColor.red
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    sender.backgroundColor = UIColor.clear
                }
        }
        
        currentQuestionIndex += 1
        
        if currentQuestionIndex < questions.count {
            nextQuestion()

        } else {
            // 顯示最終成績
            let alertController = UIAlertController(title: "完成囉！", message: "最終成績：\(score)", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "確定", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    func nextQuestion() {
        let currentQuestion = questions[currentQuestionIndex]
        question.text = currentQuestion.0
        button1.setTitle(currentQuestion.1, for: .normal)
        button2.setTitle(currentQuestion.2, for: .normal)
        
        var options = [currentQuestion.1, currentQuestion.2]
            options.shuffle()
            
            button1.setTitle(options[0], for: .normal)
            button2.setTitle(options[1], for: .normal)    }
    
       

}

