# SegueApp
swift ile geliştirilmiştir.
> 1- 1. ekranıma label ekleyelim 1st ViewController yazalım.
2- 2. view controller ulaşmak için library açıyoruz view controller obje olarak karşımıza çıkıyor ve seçiyoruz .
3- 2 view controller ‘e label ekleyelim 2nd ViewController yazalım.
4- 2. view controller için swift dosyasını manuel olarak açalım. File tıklayıp New tıklayıp oradan File tıklayalım. Dosya koyalım Cocoa Touch Class dosyasını seçelim.class: SecondViewController yazalım.
5- Her view controller ‘in ayrı dosyası olacak.
6- 2. view controller ‘in hangisini ait belirtmemiz lazım o yüzden view controller e tıklayıp  identity inspector tıklayalım sınıfımızı seçelim SecondViewController seçelim.
7- kodları artık yazabiliriz.
8-button oluşturalım ve 2nd view controller e gidelim button a tıklayalım ve control tuşuna basılı tutup 2nd view controller e götürelim segue ( view controller arası geçişi yöneten araç) den show a tıklayalım. ( show kullanıyoruz aslında navigasyon sağlıyor iki  view controller arasında gelme gitme işlemini kolaylaştırıyor.) sonra storyboard segue oluşuyor kendi ID ‘si var birden fazla oluşturabiliriz.(çok tercih edilen bir yöntem değil)
9- 1st view controller tıklayalım Editor den Embed In diyelim ve Navigation Controller seçelim.( ilk bağladığımız yer bir tane navigasyon barı takıyor ve bununla birlikte tüm yerlere segue ‘le bağladığım tüm view controller’a da navigasyon barını koyuyor ki back tuşu gelsin.
10- text field ve button oluşturalım( kullanıcı ismini girsin next butonuna tıklayınca 2. ye götürüyor ve 1. de  hangi isim girildiyse 2. de o gözüküyor.
görünümleri view controller de tanımlayalım.
11- 1st view controller tutalım ve 2nd view controller a bırakalım ve  show diyelim ve bir tane daha segu’e oluşturalım. identifier verelim toSecondVc(2. vc me giden segum )
>
//
//  ViewController.swift
//  SegueApp
//

import UIKit

class ViewController: UIViewController {
    
    var userName = ""

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Lifecylce (kullanıcı view ilk gördüğünde yapılan işlemler)
        print("viewDidLoad funcation called")
    }
    
    override func viewDidDisappear(_ animated: Bool) { //buradaki viewcontroller kayboldu.
        print("viewDidDisapper funcation called")
    }
    override func viewWillDisappear(_ animated: Bool) { //buradaki viewcontroller kaybolacak.
        print("viewWillDisappear funcation called")
    }
    
    override func viewWillAppear(_ animated: Bool) { // buradaki viewcontroller da bu görünüm belirecek
        print("viewWillApper funcation called")      // geri tıkladığımızda yazı yazmayacak.
        nameText.text = ""
    }
    
    override func viewDidAppear(_ animated: Bool) { // burdaki viewcontroller da bu görünüm gözüktü
        print("viewDidApper funcation called")
    }

    @IBAction func nextClicked(_ sender: Any) {
        userName = nameText.text! // ID sini soruyor "toSecondVC" sender bilgi yollamak için ama gerek yok o yüzden nil diyelim. next butonuna tıklandığında bu seguyei gerçekleştiriyor ve identifier bu diyorum.
        performSegue(withIdentifier: "toSecondVC", sender: nil)
    }
    override func prepare (for segue: UIStoryboardSegue, sender: Any?){  // segue olmadan önce yapılacak işlemleri hemen bu araya yazabiliyoruz
        if segue.identifier == "toSecondVC"{  // tanımlanan ID sı "toSecondVc" ise bu işlemleri yap next tuşuna basınca git go to 2nd basınca gitme işlemini yap.
            // as --casting
            let destinationVC = segue.destination as! SecondViewController // destination gidilen hedef  yer neyse onu veriyor. nereye gidilecekse segue gidilecek o yüzden casting etmemiz gerekiyor.as kullanalım.
            destinationVC.myName = userName // second view controller içerisindeki değişkenlere ulaşabiliriz.
        }
        
    //
//  SecondViewController.swift
//  SegueApp
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var myLabelSecond: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var myName = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        nameLabel.text = myName
        
        
    }
}
