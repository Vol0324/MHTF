//
//  ArtworkInfoModelGroup.swift
//  MHTF
//
//  Created by Alex Zhou on 4/10/19.
//  Copyright © 2019 MHTF. All rights reserved.
//

import Foundation
import UIKit

struct ArtworkInfoModelGroup {
    static let content = [getFirstBlock(),
                          getSecondBlock("From Psalms:\nMy anxiety reminds me daily of how fragile I can be and how part of what empowers me is an indescribable force that strengthens me to act courageously. I call him God. I’m reminded through my faith that so many things are out of my control yet to have peace, not in spite of, but because of it."),
                         getSecondBlock("Because of this, I’m so overwhelmingly grateful for every experience, every passionate friendship, and every time I have the opportunity to use my talents to help others, because I see it as a blessing."),
                         getSecondBlock("It motivates me to stay in the present which definitely helps with my anxiety. And even when I am broken, traumatized, confused, depressed, or feeling worthless I’m reminded that God loves me in spite of these things. That empowers me to love others in spite of these things."),
                         getSecondBlock("The more experiences I have that break me down, the more I understand the human condition, the more I connect to those who are struggling, and the more passionate I become about fighting for those people."),
                         getSecondBlock("I believe that good mental health is THE most important aspect of a healthy lifestyle. What people need to realize is that your mind and body are connected and whichever one you don’t take care of will start having an affect on the other."),
                         getSecondBlock("Mental Health is personal for me of course because I’ve had my own experiences with general anxiety disorder (which i'm very open about) and even major depressive episodes. I have been in therapy for over 2 years though, which has significantly helped me in every aspect of my life."),
                          getSecondBlock("My hope is that everyone who is close to me or encounters me feels encouraged to address their traumas in therapy and watch how much more clearly they see the world and themselves."),
                          getSecondBlock("Imagine walking around with a limp for 10 years and then finally going to the doctor to see why you have this pain that won’t go away."),
                          getSecondBlock("He/She/They finally explains to you that it’s from a traumatic injury that never got the proper attention and all you have to do to get the pain to decrease and the limp to go away is take some medication and attend regular physical therapy that focuses on the problem area. "),
                          getSecondBlock("Now if people can see the importance of therapy in terms of physical trauma, why can’t they see how it’s just important when it comes to mental trauma? This is what I’m working to get more people to realize."),
    ]
    
    static func getFirstBlock() -> NSAttributedString {
        let title = "The Series"
        let photographer = "Photographer: Hanna Wondmagegn"
        let model = "Model: Psalms Olivia"
        let content = "From Hanna:\nThe series was focused on mental health in the black community. Psalms is the only black female on the cheerleading team and the founder of Beta Nu Theta Service frat that is UNC's minority mental health, co-ed service fraternity. As a woman, Pslams has been very outspoken about mental health on her social media and this series was a visual representation of that experience."
        
        let setparagraphStyle = NSMutableParagraphStyle()
        setparagraphStyle.alignment = .left
        var attributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .title1), .paragraphStyle : setparagraphStyle]
        let attributedText = NSMutableAttributedString(string: title, attributes: attributes)
        attributedText.append(NSAttributedString(string: "\n", attributes: attributes))
        let setparagraphStyle2 = NSMutableParagraphStyle()
        setparagraphStyle2.alignment = .right
        attributes = [.font: UIFont.preferredFont(forTextStyle: .caption1), .paragraphStyle : setparagraphStyle2]
        attributedText.append(NSMutableAttributedString(string: "\(photographer)\n", attributes: attributes))
        attributedText.append(NSMutableAttributedString(string: "\(model)\n", attributes: attributes))
        attributedText.append(NSAttributedString(string: "\n\n", attributes: [.font: UIFont.systemFont(ofSize: 5)]))
        let setparagraphStyle3 = NSMutableParagraphStyle()
        setparagraphStyle3.alignment = .left
        attributes = [.font: UIFont.preferredFont(forTextStyle: .body), .paragraphStyle : setparagraphStyle3]
        attributedText.append(NSMutableAttributedString(string: content, attributes: attributes))
        
        return  attributedText
    }
    static func getSecondBlock(_ texts : String) -> NSAttributedString {
        let setparagraphStyle = NSMutableParagraphStyle()
        setparagraphStyle.alignment = .left
        let attributes : [NSAttributedString.Key: Any]  = [.font: UIFont.preferredFont(forTextStyle: .body), .paragraphStyle : setparagraphStyle]
        return NSMutableAttributedString(string: texts, attributes: attributes)
    }
}
