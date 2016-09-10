# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
usernames = [
  "Matthew", "Mark", "Luke", "John",
  "Rachel","Mary","Tina","Kelly",
  "Taylor","Sam","Raquel","Christina",
  "Christian","Marlon","Tyler","Edward","
  Edouard","Pierre","Andrew","James",
  "Ezekiel","Vladimir","Kyle","Stan",
  "Cartman","Kenny","Kirk","Yohann",
  "Slater","Steven","Saul","Simon"
]
usernames.each {|username| User.create(:username => username, :password => 'password', :password_confirmation => 'password')}

def generate_text_question_prompt

  question_1 = [
    "Describe how your life has been affected by ",

    "Describe the pros/cons of ",
    "Describe the pros/cons of a career in ",

    "Do you have any suggestions for ",

    "Explain how you handle ",
    "Explain how your company handles ",

    "How did you start ",
    "How did you get involved with ",

    "What is the best approach for ",
    "What are your thoughts on "
  ]

  question_2 = [
    "producing ",
    "destroying ",
    "disposing of ",
    "reviewing ",
    "evaluating ",
    "maintaining ",
    "pursuing ",
    "studying ",
    "researching ",
    "writing about ",
    "collecting ",
    "curating ",
    "buying new ",
    "professionally pursuing ",
    "enriching your knowledge of ",
    "writing a book or article about ",
    "talking to your friends about ",
    "talking to your children about ",
    "talking to your coworkers about ",
    "talking to your family about ",
    "talking to your employer about ",
    "joining a fan club for ",
    "subscribing to a magazine about ",
    "building homemade ",
    "taking out a loan for ",
    "writing to your local government regarding ",
    "the creation of ",
    "founding ",
    "marketing strategies for ",
    "the discovery of ",
    "researching ",
    "creating ",
    "fostering ",
    "encouraging ",
    "discouraging ",
    "preventing ",
    "procuring "
  ]

  question_3 = [
    "","","","","","","","","","","","","","","",
    "affordable ",
    "advanced ",
    "alternative ",
    "Arctic ",
    "Asian ",
    "beginner ",
    "biodegradable ",
    "cross-cultural ",
    "entry-level ",
    "environmentally-friendly ",
    "European ",
    "ethically-sourced ",
    "experienced ",
    "illegal ",
    "legal ",
    "luxury ",
    "Middle Eastern ",
    "modern ",
    "multilingual ",
    "North American ",
    "online ",
    "renewable ",
    "reusable ",
    "Russian ",
    "sustainable ",
    "traditional "
  ]

  question_4 = [
    "amateur ",
    "artisan ",
    "bear ",
    "blue collar ",
    "celebrity ",
    "content writer ",
    "designer ",
    "digital ",
    "hipster ",
    "journalist ",
    "non-human ",
    "Olympic athlete ",
    "owl ",
    "pet ",
    "politician ",
    "professional ",
    "research scientist ",
    "shark ",
    "stage actor ",
    "spy ",
    "simulated ",
    "unlicensed ",
    "web developer ",
    "white collar "
  ]

  question_5 = [
    "accessories",
    "apparel",
    "beverages",
    "care programs",
    "clothing",
    "competitions",
    "diets",
    "food",
    "factories",
    "fitness programs",
    "housing",
    "location services",
    "logistical services",
    "modeling",
    "regulations",
    "repurposing",
    "research programs",
    "scholarships",
    "social media networks",
    "traps",
    "technology",
    "training centers",
    "transportation"
  ]

  question_6 = [
    "?","?","?","?","?","?","?","?","?","?","?","?","?","?","?",
    " for the poor?",
    " for the wealthy?",

    " in a small town?",
    " in film and television?",
    " in high school?",
    " in large cities?",
    " in the modern day?",

    " if it would be profitable?",
    " if it would save money?",
    " if you thought nobody would notice?",
    " if it was good for the environment?",
    " if all your friends were doing it?",
    " if it was endorsed by a celebrity that you are fond of?",

    " legally?",
    " without a college degree?",
    " while living with your parents?"
  ]

  question_1.sample + question_2.sample + question_3.sample + question_4.sample + question_5.sample + question_6.sample
end

def generate_single_select_question_prompt
  question_opinion_heads = [
    "Could you see yourself involved with ",
    "Do you ever think about ",
    "Have you thought about ",
    "Would you consider ",
    "Would you be willing to try "
  ]

  question_info_heads = [
    "Are you experienced with ",
    "Are you competent in ",
    "Are you knowledgable about ",
    "Are you trained in ",

    "Do you consider yourself an expert in ",
    "Do you consider yourself informed about ",
    "Do you have any formal training in ",
    "Do you know anyone involved in ",
    "Do you know much about ",
    "Do you, or have you at any point, been involved in ",
  ]

  question_torsos = [
    "producing ",
    "destroying ",
    "disposing of ",
    "reviewing ",
    "evaluating ",
    "maintaining ",
    "pursuing ",
    "studying ",
    "researching ",
    "writing about ",
    "collecting ",
    "curating ",
    "buying new ",
    "professionally pursuing ",
    "enriching your knowledge of ",
    "writing a book or article about ",
    "talking to your friends about ",
    "talking to your children about ",
    "talking to your coworkers about ",
    "talking to your family about ",
    "talking to your employer about ",
    "joining a fan club for ",
    "subscribing to a magazine about ",
    "building homemade ",
    "taking out a loan for ",
    "writing to your local government regarding ",
    "the creation of ",
    "founding ",
    "marketing strategies for ",
    "the discovery of ",
    "researching ",
    "creating ",
    "fostering ",
    "encouraging ",
    "discouraging ",
    "preventing ",
    "procuring "
  ]

  question_navels = [
    "","","","","","","","","","","","","","","",
    "affordable ",
    "advanced ",
    "alternative ",
    "Arctic ",
    "Asian ",
    "beginner ",
    "biodegradable ",
    "cross-cultural ",
    "entry-level ",
    "environmentally-friendly ",
    "European ",
    "ethically-sourced ",
    "experienced ",
    "illegal ",
    "legal ",
    "luxury ",
    "Middle Eastern ",
    "modern ",
    "multilingual ",
    "North American ",
    "online ",
    "renewable ",
    "reusable ",
    "Russian ",
    "sustainable ",
    "traditional "
  ]

  question_hips = [
    "amateur ",
    "artisan ",
    "bear ",
    "blue collar ",
    "celebrity ",
    "content writer ",
    "designer ",
    "digital ",
    "hipster ",
    "journalist ",
    "non-human ",
    "Olympic athlete ",
    "owl ",
    "pet ",
    "politician ",
    "professional ",
    "research scientist ",
    "shark ",
    "stage actor ",
    "spy ",
    "simulated ",
    "unlicensed ",
    "web developer ",
    "white collar "
  ]

  question_knees = [
    "accessories",
    "apparel",
    "beverages",
    "care programs",
    "clothing",
    "competitions",
    "diets",
    "food",
    "factories",
    "fitness programs",
    "housing",
    "location services",
    "logistical services",
    "modeling",
    "regulations",
    "repurposing",
    "research programs",
    "scholarships",
    "social media networks",
    "traps",
    "technology",
    "training centers",
    "transportation"
  ]

  question_opinion_feet = [
    "?","?","?","?","?","?","?","?","?","?","?","?","?","?","?",
    " for the poor?",
    " for the wealthy?",

    " in a small town?",
    " in film and television?",
    " in high school?",
    " in large cities?",
    " in the modern day?",

    " if it would be profitable?",
    " if it would save money?",
    " if you thought nobody would notice?",
    " if it was good for the environment?",
    " if all your friends were doing it?",
    " if it was endorsed by a celebrity that you are fond of?",

    " legally?",
    " without a college degree?",
    " while living with your parents?"
  ]

  question_info_feet = [
    "?"
  ]

info = question_info_heads.sample + question_torsos.sample + question_navels.sample + question_hips.sample + question_knees.sample + question_info_feet.sample
opinion = question_opinion_heads.sample + question_torsos.sample + question_navels.sample + question_hips.sample + question_knees.sample + question_opinion_feet.sample
prompts = [info, opinion]
prompts.sample

end

def generate_survey_title
  survey_1 = [
    "User opinions of the ",
    "The ",
    "Some of the ",
    "On the "
  ]

  survey_1_short = [
    "Thoughts on the ",
    "Ideas for the ",
    "Opinions about the ",
    "Guidelines for the ",
    "Suggestions for the ",
    "Simple ideas about the ",
    "User opinions about the ",
    "User impressions on the ",
    "Feedback on the ",
    "User feedback on the ",
    "Employee feedback on the ",
    "User thoughts on the ",
    "User opinions on the ",
    "User insights on the ",
    "Student feedback on the ",
    "Student insights on the ",
    "Student opinions on the ",
    "Student thoughts on the ",
    "Employee thoughts on the ",
    "Employee opinions on the ",
    "Employee insights on the ",
  ]

  survey_2 = [

    " marketing ",
    " ethical ",
    " financial ",
    " ontological ",
    " medical ",
    " epidemiological ",
    " psychological ",
  ]

  survey_3 = [
    "applications of ",
    "cultural concepts of ",
    "implications of ",
    "uses of ",
    "history of ",
    "implications of ",
    "effects of ",
    "sentiments of ",
    "ramifications of "
  ]

  survey_4 = [
    "democratic ",
    "autocratic ",
    "unsupervised ",
    "supervised" ,
    "automatic ",
    "crowd-sourced ",
    "data-driven ",
    "relatively recent ",
    "ancient ",
    "cutting-edge ",
    "untested ",
    "well-researched ",
    "experimental ",
    "purportedly healthy ",
    "allegedly dangerous ",
    "financially-motivated ",
    "economically sound ",
    "bipartisan ",
    "partisan ",
    "traditional ",
    "contemporary ",
    "non-standard ",
    "alternative "
  ]

  survey_5 = [
    "practices ",
    "techniques ",
    "methods ",
    "theories "
  ]

  survey_6 = [
    "for ",
    "warning against ",
    "in favor of ",
    "used to predict the results of ",
    "used to discuss ways that one might approach "
  ]

  survey_7 = [
    "amplifying ",
    "avoiding the marginalization of ",
    "decreasing the unemployment rate of ",
    "increasing population growth of ",
    "contacting",

    "facilitating ",
    "fostering a culture of ",

    "increasing the productivity of ",
    "increasing wealth among ",

    "improving the performance of ",

    "preventing ",
    "promoting ",
    "properly incentivising ",
    "sensible laws around ",
    "sustainably developing ",
    "supporting the implementation of ",
    "the control of ",
    "the reduction of ",
    "the regulation of ",
    "the effective employment of ",
  ]

  survey_8 = [
    "bears ",
    "plants ",
    "animals ",
    "sharks ",
    "owls ",
    "world leaders ",
    "early adopters ",
    "venture capitalists ",
    "average Joes ",
    "employees ",
    "employers ",
    "friends ",
    "acquaintances ",
    "contacts ",
    "romantic interests ",
    "our users ",
    "celebrities ",
    "Republicans ",
    "Democrats ",
    "Liberals ",
    "Conservatives ",
    "sports fans ",
    "former teachers ",
    "recent graduates ",
    "media personalities ",
    "prominent social media users "
  ]

  survey_9 = [
    "across cultures",
    "in the workforce",
    "on planes",
    "without borders",
    "in public settings",
    "with firearms",
    "while driving",
    "on social media",
    "within their own homes",
    "in competitive settings",
    "without disturbing their natural environment",
    "in an environmentally-friendly way",
    "while preventing the spread of disease",
    "in a sustainable way",
    "in other cultures",
    "in positions of power",
    "in the modern age",
    "in economically suppressed areas",
    "today and in the past",
    "with no negative side effects"
  ]

  short_prompt = survey_1_short.sample.gsub("the", "") + survey_7.sample + survey_8.sample + survey_9.sample
  long_prompt = survey_1.sample + survey_2.sample + survey_3.sample + survey_4.sample + survey_5.sample + survey_6.sample + survey_7.sample + survey_8.sample + survey_9.sample
  prompts = [short_prompt, short_prompt, short_prompt, short_prompt, short_prompt, short_prompt, long_prompt]
  prompts.sample
end


def generate_multi_select_question_prompt
  prompt_1 = [
    "What are a few ",
    "What are some effective ",
    "What are some of the best ",

    "Have you tried any of the following ",
    "Have you used any of the following ",
    "Do you use any of the following ",

    "How would you approach ",
    "How can we develop ",
    "How can we produce better ",

    "Which are the most promising ",
    "Which of the following are useful ",
    "Which of the following are NOT useful ",
    "Which of the following are acceptable ",
    "Which of the following are unacceptable ",
    "Which of the following are NOT effective ",
    "Which of these are effective ",

    "Please select your favorite ",
    "Please select the most promising ",
    "Please select the most useful ",
    "Please select the best "
  ]

  prompt_2 = [
    "approaches ",
    "ideas ",
    "measures ",
    "methods ",
    "options ",
    "proposals ",
    "solutions ",
    "strategies ",
    "tactics ",
    "techniques",
    "tools ",
  ]

  prompt_2_point_5 = [
    "for ",
    "for the prevention of ",
    "for the promotion of ",
    "for coping with ",
    "for dealing with ",
    "for handling ",
    "for circumventing ",
    "for avoiding ",

    "to allow ",
    "to allow common-sense ",
    "to allow sensible ",
    "to allow controlled ",

    "to achieve ",
    "to augment ",
    "to circumvent ",
    "to cope with ",
    "to counteract ",
    "to deal with ",

    "to decrease ",
    "to decrease black-market ",
    "to decrease illegal ",
    "to decrease rampant ",
    "to decrease uncontrolled ",

    "to enable ",
    "to enable sustainable ",

    "to enforce international standards of ",
    "to enforce laws surrounding ",
    "to enforce regulations pertaining to ",

    "to enhance ",

    "to ensure ",
    "to ensure fair-trade ",
    "to ensure legal ",
    "to ensure regulated ",

    "to guarantee ",

    "to increase ",
    "to increase environmentally-friendly",
    "to increase positive ",
    "to increase profitable ",
    "to increase socially-conscious ",
    "to increase sustainable ",

    "to prevent ",
    "to prevent unfair ",

    "to promote ",
    "to protect ",
    "to protect against ",
    "to prevent ",
    "to raise awareness about ",

    "to reduce ",
    "to reduce corruption in ",
    "to reduce the environmental impact of ",

    "to secure funding for ",
    "to shed light on "
  ]

  prompt_3 = [
    "animal ",
    "human ",
    "online ",
    "professional ",
    "amateur ",
    "childhood ",
    "emotional ",
    "psychological ",
    "cognitive ",
    "supernatural ",
    "bacterial ",
    "viral ",
    "fungal ",
    "arboreal ",
    "rainforest ",
    "koala ",
    "bilateral ",
    "expert",
    "political ",
    "educational ",
    "environmental ",
    "experimental ",
    "interpersonal "
  ]

  prompt_4 = [
    "conflict",
    "creation",
    "development",
    "destruction",
    "discomfort",
    "friction",
    "growth",
    "happiness",
    "productivity",
    "proliferation",
    "relations",
    "risk-taking"
  ]

  prompt_5 = [
    "?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?",

    " based on the current scientific consensus?",
    " based on your experience?",
    " based on your understanding?",

    " from a financial standpoint?",
    " from an ethical standpoint?",
    " from your perspective?",

    " in a laboratory setting?",
    " in an academic setting?",
    " in government?",
    " in private?",
    " in our country?",
    " in our schools?",
    " in the classroom?",
    " in the home?",
    " in the workplace?",
    " in your city?",
    " in your family?",
    " in your household?",
    " in your opinion?",

    " on a municipal scale?",
    " on a national scale?",
    " on an international scale?"
  ]

  prompt_1.sample + prompt_2.sample + prompt_2_point_5.sample + prompt_3.sample + prompt_4.sample + prompt_5.sample
end

def generate_multi_select_question_answer
  answer_1 = [
    "A formal study",
    "A return to traditional values",
    "Academic focus",
    "Aggressive capitalism",
    "Bears",
    "Communism",
    "Corporate retreats",
    "Crowd funding",
    "Democracy",
    "Economic reform",
    "Emotions",
    "Empathy",
    "Expensive vacations",
    "Frequent meetings",
    "Friendly competition",
    "Friendly discussion",
    "Friendships",
    "Government oversight",
    "Individual attention",
    "Lobbying",
    "Legal action, up to and including a lawsuit",
    "Old-fashioned hard work and know-how",
    "Owls",
    "Physical force",
    "Rapport",
    "Sharks",
    "Squirrels",
    "Strict laws and regulations",
    "Thoughtful debate",
    "Traditional rituals",
    "University education"
  ]

  answer_2 = [
    ".",".",".",".",".",".",".",".",".",".",".",".",".",".",".",".",
    "!","!","!","!","!","!","!",

    " and hard work.",
    " and other related things.",

    "; That's a popular choice.",
    "; That's always an option.",
    "; That sounds promising.",

    ", as long as that would be perceived as cool.",
    ", at a reasonable price.",

    ", but not the bad kind.",
    ", but not the way most people think.",
    ", but nothing too excessive.",
    ", but only within reason.",
    ", but only after someone else has tried it.",

    " could be effective.",
    " could work.",
    " could work, with sufficient funding.",

    ", despite potential funding problems",
    ", despite the risk.",

    ", if that's not too expensive.",
    ", if necessary.",
    ", if nothing else can be done.",
    ", if that's what others are doing.",
    ", if the situation calls for that.",

    ", or something similar.",
    "; That seems promising.",
    "; That seems effective.",
    ", so long as those involved are experts.",
    ", as long as that course of action is in line with my personal ethics.",
    " with sufficient oversight.",
    ", within reason."
  ]

  answer_1.sample + answer_2.sample
end

50.times do
  user = User.all.sample
  survey = user.surveys.create(:title => generate_survey_title)
  rand(4..10).times do
    qtypes = ["text", "multi","single"]
    question_type = qtypes.sample
    if question_type == "text"
      question = survey.questions.create(:question_type => question_type, :prompt => generate_text_question_prompt)
    elsif question_type == "multi"
      question = survey.questions.create(:question_type => question_type, :prompt => generate_multi_select_question_prompt)
      rand(3..6).times do
        question.choices.create(:text => generate_multi_select_question_answer)
      end
    else
      question = survey.questions.create(:question_type => question_type, :prompt => generate_single_select_question_prompt)
      question.choices.create(:text => "Yes.")
      question.choices.create(:text => "No.")
      question.choices.create(:text => "Undecided.") if rand(1..4) > 3
      question.choices.create(:text => "Prefer not to answer.") if rand(1..4) > 3
    end
  end
end
