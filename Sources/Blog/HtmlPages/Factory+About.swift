//
//  File.swift
//  
//
//  Created by Alex Stevens on 12/7/21.
//

import Foundation
import Publish
import Plot

extension MyHTMLFactory {
    func makeAboutHTML<T: Website>(for index: Index, context: PublishingContext<T>) throws -> HTML {
        
        let me: Path = "Images/my_pic.jpeg"
        
        return HTML(
            .head(for: index, on: context.site),
            .body(
                .topBanner(),
                .navigationBar(for: context),
                .br(),
                .img(.src(me)),
                .br(),
                
                    .div(
                        .class("about-me-body"),
                        .p("Hello there!"),
                        .br(),
                        .p("Welcome to my swift blog."),
                        .br(),
                        .p("""
                                             A little about myself. I started out like most other engineers did. Tinkering with things as a child. I loved Lego's, I loved building things, and learning how they
                                             worked. I would take apart remote controls, radios, anything I could get my hands on and would take them apart, and try to put them back together. Sorry Mom 😄. Around age 11 I taught myself
                                             how to jailbreak my iPod Touch and that was my introduction into the world of everything Apple. I was fascinated and definitely fell down the rabbit hole! I did not get into more consistent
                                             programming until high school, where I dove into web development. I bounced around in college from databases, to python scripting, etc until I revisited my passion for iOS development.
                                             I had a capstone project where the assignment was to 'Create Something'. So I decided to make a full fledged iOS app and put it into the app store. It was a simple weather app which had some fancy animations,
                                             transitions, and made a singluar API call. But I was very proud of myself for completing a project like that. Its still available on the app store for those curious, under the name "XenoWeathr".
                                             """),
                        .br(),
                        .p("""
                                             I finished college with 2 bachelors degrees, in Computer Science and Software Egnineering. While I was in school I interned as an iOS developer at J.P. Morgan Chase and was lucky enough to receive an offer
                                             for full time employment there. I worked at Chase for roughly 4 years where I learned iOS development at a large scale. I learned MVVM architecture, Unit Testing, UIKit essentials and more. I plan to cover all
                                             the things I have learned (and the things I continue to learn) as a part of this blog.
                                             """),
                        .br(),
                        .p("""
                                         In 2021, I was on the job hunt again and accepted a job offer for iOS development on the DoorDash app. It is a new chapter for me, and I could not be more excited!
                                         
                                         Cheers! and thank you to each and every one of you who reads my story.
                                         
                                         -A
                                         
                                         """)
                    ),
                
                .myFooter(for: context.site)
            )
        )
    }
}
