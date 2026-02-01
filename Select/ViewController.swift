import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var moneytext: UILabel!
    @IBOutlet weak var familyint: UILabel!
    @IBOutlet weak var corporateint: UILabel!
    @IBOutlet weak var happinessint: UILabel!
    @IBOutlet weak var mainimage: UIImageView!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var EventText: UILabel!
    @IBOutlet weak var selectiontext1: UILabel!
    @IBOutlet weak var selectiontext2: UILabel!

    @IBOutlet weak var papersbutton: UIButton!
    
    static var money:Int = 100000
    static var family:Int = 50
    static var corporate:Int = 50
    static var happiness:Int = 50
    
    static var papersodd : Int = 0

    static var selectionarr = [Selections]()

    private var currentSelection: Selections?
    
    
    static var turncounter = 1
    
    var customeventchange = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Örnek eventler
        if let img1 = UIImage(named: "moneycrisis"),
           let img2 = UIImage(named: "familytime"),
           let img3 = UIImage(named: "owntime") {

            let moneycrisis = Selections(selectioneventtext: "A salary crisis broke out among employees at the company", selectionimage: img1, selectiontype1: 1,selectiontype2: 2,selectionoption1: "Give them what they want",selectionoption2: "No we cant give any more money")
            let familytime  = Selections(selectioneventtext: "Your family wants you to spend more time with them", selectionimage: img2, selectiontype1: 3,selectiontype2: 4,selectionoption1: "Anything for my family",selectionoption2: "I need to work more")
            let owntime   = Selections(selectioneventtext: "You want a quick nap in the office", selectionimage: img3, selectiontype1: 5,selectiontype2: 6,selectionoption1: "Hell yeah",selectionoption2: "Work is more important")
            let familyrequest = Selections(selectioneventtext: "Your son wants a new video game", selectionimage: UIImage(named: "familyrequest")!, selectiontype1: 7,selectiontype2: 8,selectionoption1: "I cant afford right now",selectionoption2: "If that makes you happy why not")
            let carupgrade = Selections(selectioneventtext: "You want to upgrade your car", selectionimage: UIImage(named: "carupgrade")!, selectiontype1: 9,selectiontype2: 10,selectionoption1: "Thats a nice car over here",selectionoption2: "I cant upgrade right now")
            let everythingforfam = Selections(selectioneventtext: "Your favorite football team has a match today but your family wants to go dinner", selectionimage: UIImage(named: "everythingforfam")!, selectiontype1: 11, selectiontype2: 12, selectionoption1: "I must watch!", selectionoption2: "Family matters first")

            ViewController.selectionarr.append(contentsOf: [moneycrisis, familytime, owntime,familyrequest,carupgrade,everythingforfam])
        }

        // Tip açıklaması:
        // 1: para ↓, corporate ↑
        // 2: para ↑, corporate ↓
        // 3: family ↑, corporate ↓
        // 4: family ↓, corporate ↑
        // 5: happiness ↑, corporate ↓
        // 6: happiness ↓, corporate ↑
        // 7: para ↑, family ↓
        // 8: para ↓, family ↑
        // 9: para ↓, happiness ↑
        // 10: para ↑, happiness ↓
        // 11: family ↓, happiness ↑
        // 12: family ↑, happiness ↓


        gameplay()
    }

    private func refreshStatsUI() {
        moneytext.text = "\(ViewController.money)"
        familyint.text = "\(ViewController.family)"
        corporateint.text = "\(ViewController.corporate)"
        happinessint.text = "\(ViewController.happiness)"
    }
    
    func events(){
        ViewController.selectionarr.removeAll()
        if let img1 = UIImage(named: "moneycrisis"),
           let img2 = UIImage(named: "familytime"),
           let img3 = UIImage(named: "owntime") {

            let moneycrisis = Selections(selectioneventtext: "A salary crisis broke out among employees at the company", selectionimage: img1, selectiontype1: 1,selectiontype2: 2,selectionoption1: "Give them what they want",selectionoption2: "No we cant give any more money")
            let familytime  = Selections(selectioneventtext: "Your family wants you to spend more time with them", selectionimage: img2, selectiontype1: 3,selectiontype2: 4,selectionoption1: "Anything for my family",selectionoption2: "I need to work more")
            let owntime   = Selections(selectioneventtext: "You want a quick nap in the office", selectionimage: img3, selectiontype1: 5,selectiontype2: 6,selectionoption1: "Hell yeah",selectionoption2: "Work is more important")
            let familyrequest = Selections(selectioneventtext: "Your son wants a new video game", selectionimage: UIImage(named: "familyrequest")!, selectiontype1: 7,selectiontype2: 8,selectionoption1: "I cant afford right now",selectionoption2: "If that makes you happy why not")
            let carupgrade = Selections(selectioneventtext: "You want to upgrade your car", selectionimage: UIImage(named: "carupgrade")!, selectiontype1: 9,selectiontype2: 10,selectionoption1: "Thats a nice car over here",selectionoption2: "I cant upgrade right now")
            let everythingforfam = Selections(selectioneventtext: "Your favorite football team has a match today but your family wants to go dinner", selectionimage: UIImage(named: "everythingforfam")!, selectiontype1: 11, selectiontype2: 12, selectionoption1: "I must watch!", selectionoption2: "Family matters first")

            ViewController.selectionarr.append(contentsOf: [moneycrisis, familytime, owntime,familyrequest,carupgrade,everythingforfam])
        }
    }
    
    func customevents(){
        if ViewController.happiness <= 0{
            ViewController.selectionarr.removeAll()
            if ViewController.money <= 100000{
                let poorhappiness = Selections(selectioneventtext: "You are no longer happy with your life. You moved to an apartment that fits your budget and you live alone.", selectionimage: UIImage(named: "poorhappiness")!, selectiontype1: 0,selectiontype2: 0,selectionoption1: "Thats okay",selectionoption2: "Thats okay")
                ViewController.selectionarr.append(poorhappiness)
            }
            if ViewController.money > 100000{
                let normalhappiness = Selections(selectioneventtext: "You are no longer happy with your life. You moved to an apartment that fits your budget and you live alone.", selectionimage: UIImage(named: "normalhappiness")!, selectiontype1: 0,selectiontype2: 0,selectionoption1: "Thats okay",selectionoption2: "Thats okay")
                ViewController.selectionarr.append(normalhappiness)
            }
            if ViewController.money >= 200000{
                let richhappiness = Selections(selectioneventtext: "You are no longer happy with your life. You moved to an apartment that fits your budget and you live alone.", selectionimage: UIImage(named: "richhappiness")!, selectiontype1: 0,selectiontype2: 0,selectionoption1: "Thats okay",selectionoption2: "Thats okay")
                ViewController.selectionarr.append(richhappiness)
            }
        }
        if ViewController.corporate <= 0{
            ViewController.selectionarr.removeAll()
            if ViewController.money <= 100000{
                let poorcorporate = Selections(selectioneventtext: "You kicked from your own company and you dont have enough money to build new one", selectionimage: UIImage(named: "poorcorporate")!, selectiontype1: 0,selectiontype2: 0,selectionoption1: "Thats okay",selectionoption2: "Thats okay")
                ViewController.selectionarr.append(poorcorporate)
            }
            if ViewController.money > 100000{
                let normalcorporate = Selections(selectioneventtext: "You kicked from your own company", selectionimage: UIImage(named: "normalcorporate")!, selectiontype1: -1,selectiontype2: 0,selectionoption1: "Build a new one",selectionoption2: "Thats okay")
                ViewController.selectionarr.append(normalcorporate)
                customeventchange = true
            }
           
        }
        if ViewController.family <= 0{
            ViewController.selectionarr.removeAll()
            let familydeparted = Selections(selectioneventtext: "Your family is disturbed by your indifference and is on the verge of falling apart. I think you need to take care of them a little.", selectionimage: UIImage(named: "familydeparted")!, selectiontype1: 0,selectiontype2: 0,selectionoption1: "Thats okay",selectionoption2: "Thats okay")
            ViewController.selectionarr.append(familydeparted)
        }
    }

    func gameplay() {
        refreshStatsUI()
        customevents()

        guard !ViewController.selectionarr.isEmpty else { return }

        // Karışık sıradan bir seçim al
        ViewController.selectionarr.shuffle()
        let selection = ViewController.selectionarr[0]
        currentSelection = selection

        // Ekrana yazıları ve resmi bas
        EventText.text = selection.eventtext
        mainimage.image = selection.image

        // Buton yazılarını güncelle (her selection kendi seçeneklerini taşır)
        selectiontext1.text = selection.option1
        selectiontext2.text = selection.option2
    }

    private func applyEffects(for choiceType: Int) {
        switch choiceType {
        case -1:
            ViewController.money -= 100000
            ViewController.corporate += 50
        case 0:
            exit(0)
        case 1:
            ViewController.money -= 10000
            ViewController.corporate += 10
        case 2:
            ViewController.money += 10000
            ViewController.corporate -= 10
        case 3:
            ViewController.family += 10
            ViewController.corporate -= 10
        case 4:
            ViewController.family -= 10
            ViewController.corporate += 10
        case 5:
            ViewController.happiness += 10
            ViewController.corporate -= 10
        case 6:
            ViewController.happiness -= 10
            ViewController.corporate += 10
        case 7:
            ViewController.family -= 10
            ViewController.money += 10000
        case 8:
            ViewController.family += 10
            ViewController.money -= 10000
        case 9:
            ViewController.happiness += 10
            ViewController.money -= 10000
        case 10:
            ViewController.happiness -= 10
            ViewController.money += 10000
        case 11:
            ViewController.happiness += 10
            ViewController.family -= 10
        case 12:
            ViewController.happiness -= 10
            ViewController.family += 10
        default:
            break
        }
    }

    @IBAction func button1tap(_ sender: Any) {
        guard let type = currentSelection?.type1 else { return }
        applyEffects(for: type)
        if customeventchange {
            events()
            customeventchange = false
        }
        gameplay()
    }

    @IBAction func button2tap(_ sender: Any) {
        guard let type = currentSelection?.type2 else { return }
        applyEffects(for: type)
        if customeventchange {
            events()
            
            customeventchange = false
        }
        gameplay()
    }
    
    @IBAction func papersbuttontap(_ sender: Any) {
        performSegue(withIdentifier: "toExchangeMarket", sender: nil)
        
    }
    
    
    
}
