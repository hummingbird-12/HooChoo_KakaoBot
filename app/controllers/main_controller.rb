class MainController < ApplicationController
    @@prev = ""
    @@sel = ""
    @@plc = ""
    def keyboard_init
        @msg = {
            type: "buttons",
            buttons: ["안녕 후추봇! 후식 추천해줘", "후추봇, 넌 누구니"]
        }
        render json: @msg, status: :ok
    end
    
    def chat_control
        @menu = params[:content]
        des = [
            ["초코릿", "초코라테", "카라멜마끼아또", "브라우니", "케잌", "베라 아이스크림", "베브릿지 누텔라쉐이크", "카페모카"], #단거
            ["프레첼", "포카칩"], #짠거
            ["아이스아메리카노", "따뜻한아메리카노", "카페라떼", "카푸치노", "베라 그린티"], #쓴거
            ["모히또", "레몬에이드", "자몽에이드", "자몽빙수", "망고 설빙", "베라 애플 민트향", "이디야 그린 애플 플렛치노", "이디야 청포도 플렛치노"], #상큼한거
            ["초코릿케잌", "베라 바닐라", "베라 아몬드 자모카훠지", "베라 쿠키엔초콜릿", "베라 월넛"], #느끼한거
            ["인절미설빙", "소화제", "아이스아메리카노", "소주", "막걸리", "베라 민트향 초콜릿 칩", "베라 그린티", "그린티 설빙"], #깔끔한거
            ["아이스아메리카노", "레몬에이드", "자몽에이드", "베라 레인보우샤베트", "소주", "칭따오 캔맥", "카프리 병맥", "칵테일 롱티", "동동주와 사이다"] #시원한거
        ]
        
        ##### 기본 메뉴 #####
        if @menu == "안녕 후추봇! 후식 추천해줘"
            @msg = {
                message: {
                    text: "훛훛훛 어떤 방식으로 추천해줄까?",
                    photo: {
                        url: "https://mblogthumb-phinf.pstatic.net/MjAxNzEwMDlfMjIz/MDAxNTA3NTQ0MDc2NzEx.CjA4Kb4_jxun26oejK23TmUb53X8_8IPjG09WKGhGY4g.XP2N9edesjqE-CPtSHIOqJO1JhiYiuuoJVsItE8k1XYg.JPEG.tooth_/20171009_191332.jpg?type=w800",
                        width: 640,
                        height: 640
                    }
                },
                keyboard: {
                    type: "buttons",
                    buttons: ["먹은 음식에 어울리는 후추!", "기분에 따른 후추!", "랜덤 후-추!"]
                }
            }
            render json: @msg, status: :ok
        end
        
        if @menu == "후추봇, 넌 누구니"
            @msg = {
                message: {
                    text: "나는 너의 후식 추천을 돕기위해 나타난 후식 추천 요오정! 후추봇이야!",
                    photo: {
                        url: "http://postfiles4.naver.net/MjAxNzEwMDlfOTIg/MDAxNTA3NTM1NDkwNTY5.CXqU6chSOw22oFUWili53d9WA1D6GHaM1Uw5XD0FOl8g.kE9GgLTtWwulXtvmYTg7Xvy9y1O4IzjBFoKzimusAC0g.JPEG.tooth_/KakaoTalk_2017-10-09-11-49-47_Photo_56.jpeg?type=w773",
                        width: 640,
                        height: 640
                    }
                },
                keyboard: {
                    type: "buttons",
                    buttons: ["처음으로"]
                }
            }
            render json: @msg, status: :ok
        end
        
        #################################################
        
        ##### 1. (먹은 음식에 따른 추천) #####
        if @menu == "먹은 음식에 어울리는 후추!"
            @msg = {
                message: {
                    text: "오늘 어떤 음식을 먹었는지 알려줘" 
                },
                keyboard: {
                    type: "buttons",
                    buttons: ["느끼느끼..", "달달한거!", "짠거!", "채소채소", "매운거"]
                }
            }
            render json: @msg, status: :ok
        end
        
        ####### 1.1 (느끼) #######
        if @menu == "느끼느끼.." or @menu == "다시다시"
            @@prev = @menu
            @@sel = [des[3].sample, des[5].sample].sample
            @msg = {
                message: {
                    text: @@sel + " 요거 아주 추천하지!"
                },
                keyboard: {
                    type: "buttons",
                    buttons: ["다시다시", "먹으러 가고 싶어!", "고마워 후추!"]
                }
            }
            render json: @msg, status: :ok
        end
        
        ####### 1.2 (달달) #######
        if @menu == "달달한거!" or @menu == "마음에 안들어"
            @@prev = @menu
            @@sel = [des[1].sample, des[5].sample].sample
            @msg = {
                message: {
                    text: @@sel + "어때?"
                },
                keyboard: {
                    type: "buttons",
                    buttons: ["마음에 안들어", "먹으러 가고 싶어!", "고마워 후추!"]
                }
            }
            render json: @msg, status: :ok
        end
        
        ####### 1.3 (짠) #######
        if @menu == "짠거!" or @menu == "이거말고!"
            @@prev = @menu
            @@sel = [des[0].sample, des[6].sample].sample
            @msg = {
                message: {
                    text: @@sel + "먹어봐! "
                },
                keyboard: {
                    type: "buttons",
                    buttons: ["이거말고!", "먹으러 가고 싶어!", "고마워 후추!"]
                }
            }
            render json: @msg, status: :ok
        end
        
        ####### 1.4 (채소채소) #######
        if @menu == "채소채소" or @menu == "다른거 다른거!"
            @@prev = @menu
            @@sel = [des[0].sample, des[4].sample].sample
            @msg = {
                message: {
                    text: @@sel
                },
                keyboard: {
                    type: "buttons",
                    buttons: ["다른거 다른거!", "먹으러 가고 싶어!", "고마워 후추!"]
                }
            }
            render json: @msg, status: :ok
        end
        
        ####### 1.5 (매운) #######
        if @menu == "매운거" or @menu == "이거 시러어!"
            @@prev = @menu
            @@sel = [des[0].sample, des[4].sample].sample
            @msg = {
                message: {
                    text: @@sel + "어때?"
                },
                keyboard: {
                    type: "buttons",
                    buttons: ["이거 시러어!", "먹으러 가고 싶어!", "고마워 후추!"]
                }
            }
            render json: @msg, status: :ok
        end
        
        ##### 2. (기분에 따른 추천) #####
        if @menu == "기분에 따른 후추!"
            @msg = {
                message: {
                    text: "훛훛 너의 기분은" 
                },
                keyboard: {
                    type: "buttons",
                    buttons: ["몰라 배고파!", "해피해!","우울해:'(","지쳤어!:(","신난다>0<"]
                }
            }
            render json: @msg, status: :ok
        end
        
        ####### 2.1 (몰라 배고파!) #######
        if @menu == "몰라 배고파!"
            @msg = {
                message: {
                    text: "후식은 밥먹은 후에!!!"
                },
                keyboard: {
                    type: "buttons",
                    buttons: ["처음으로"]
                }
            }
            render json: @msg, status: :ok
        end
        
        ####### 2.2 (해피해!) #######
        if @menu == "해피해!" or @menu == "딴거딴거!"
            @@prev = @menu
            @@sel = [des[3].sample, des[6].sample].sample
            @msg = {
                message: {
                    text: @@sel + " 먹고 더 해피해지자!"
                },
                keyboard: {
                    type: "buttons",
                    buttons: ["딴거딴거!", "먹으러 가고 싶어!", "고마워 후추!"]
                }
            }
            render json: @msg, status: :ok
        end
        
        ####### 2.3 (우울해:'() #######
        if @menu == "우울해:'(" or @menu == "너 때문에 더 우울해ㅠ"
            @@prev = @menu
            @@sel = [des[0].sample, des[2].sample, des[6].sample].sample
            @msg = {
                message: {
                    text: @@sel + " 먹고 기운내!"
                },
                keyboard: {
                    type: "buttons",
                    buttons: ["너 때문에 더 우울해ㅠ", "먹으러 가고 싶어!", "고마워 후추!"]
                }
            }
            render json: @msg, status: :ok
        end
        
        ####### 2.4 (지쳤어!:() #######
        if @menu == "지쳤어!:(" or @menu == "더 지친다아.."
            @@prev = @menu
            @@sel = [des[0].sample, des[1].sample, des[6].sample].sample
            @msg = {
                message: {
                    text: @@sel + " 먹고 힘내!"
                },
                keyboard: {
                    type: "buttons",
                    buttons: ["더 지친다아..", "먹으러 가고 싶어!", "고마워 후추!"]
                }
            }
            render json: @msg, status: :ok
        end
        
        ####### 2.5 (신난다>0<) #######
        if @menu == "신난다>0<" or @menu == "다시 추천해보시지!"
            @@prev = @menu
            @@sel = [des[0].sample, des[6].sample].sample
            @msg = {
                message: {
                    text: @@sel + " 먹고 놀자~~"
                },
                keyboard: {
                    type: "buttons",
                    buttons: ["다시 추천해보시지!", "먹으러 가고 싶어!", "고마워 후추!"]
                }
            }
            render json: @msg, status: :ok
        end

        ##### 3. (랜덤 추천) #####
        if @menu == "랜덤 후-추!"
            @@sel = (des.sample).sample
            @msg = {
                message: {
                    text: "바로바로 " + @@sel + "!!!!!!!"
                    #text: "내가 추천해줄 후우우우식은..!!!!!!" 
                },
                keyboard: {
                    type: "buttons",
                    buttons: ["랜덤 후-추!", "먹으러 가고 싶어!", "고마워 후추!"]
                }
            }
            render json: @msg, status: :ok
        end
        
        if @menu == "처음으로" or @menu == "고마워 후추!" or @menu == "먹으러 가고 싶어!"
            @msg = {
                message: {
                    text: "안녕 나는 후추봇이야!" 
                },
                keyboard: {
                    type: "buttons",
                    buttons: ["안녕 후추봇! 후식 추천해줘", "후추봇, 넌 누구니"]
                }
            }
            render json: @msg, status: :ok
        end
        
        #if @menu == "먹으러 가고 싶어!"
        #    @msg = {
        #        message: {
        #            text: "장소를 알려줘!"
        #        },
        #        keyboard: {
        #            type: "text"
        #        }
        #    }
        #    render json: @msg, status: :ok
            
   #     else
  #          @@plc = @menu
  #          @naverApi = HTTParty.get("http://newsapiserver.herokuapp.com/news?keyword=#{URI.escape(@@plc + " " + @@sel)}")
   #         @buttons = []
  #          @naverApi.parsed_response["items"].each do |item|
   #             @buttons << "[장소]#{item["title"]}"
    #           message: {
     #               text: "장소를 알려줘!"
      #          },
      #          keyboard: {
      #              type: "buttons",
      #              buttons: @buttons
      #          }
      #      }
      #      render json: @msg, status: :ok
      #  end
    end
end
