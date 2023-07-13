
public class Services{
    private init(){}
    public static func doGreatings(greeting: String)->String{
        print("Greeting \(greeting)")
        return "Answer: Walikum slaam! Hello How are you."
    }
    
//    let bundle = pathToBundle // define for your app or framework
//    if let image = UIImage(named: "qasim", inBundle: bundle, compatibleWithTraitCollection: nil) {
//        // process image
//    }
    public static func getResources()->UIImage?{
        return UIImage()
    }
//
//        @swalkner Didn't remember this post but I guess yes. On my Core subspec: s.subspec 'Core' I just have: ss.resources = ['Pod/Resources/Fonts/*.ttf', 'Pod/Resources/Extra.xcassets', 'Pod/Resources/Mocks/*.json']
}
