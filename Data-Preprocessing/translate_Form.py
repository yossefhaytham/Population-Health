import pandas as pd

# 1. Define File Paths
arabic_file_path = r"C:\Users\T.B\Desktop\first_file.xlsx"
# Update this path to your actual English file
english_file_path = r"C:\Users\T.B\Desktop\English_file.xlsx" 
final_output_path = r"C:\Users\T.B\Desktop\data_set_Daily_Habits.xlsx"

# 2. Nested Dictionary for Translation
translation_dict = {
    "كم عمرك؟": {
        "أقل من 18": "Under 18",
        "18-24": "18-24",
        "25-34": "25-34",
        "35-44": "35-44",
        "45-54": "45-54",
        "55+": "55+"
    },
    "ما هو جنسك؟": {
        "امراه": "Female",
        "رجل": "Male"
    },
    "في المتوسط، كم عدد الساعات في اليوم التي تستخدم فيها الأجهزة الرقمية (الهاتف، الكمبيوتر المحمول، الجهاز اللوحي)؟": {
        "أقل من ساعتين": "Less than 2 hours",
        "2 - 4 ساعة": "2 - 4 hours",
        "4 - 6 ساعة": "4 - 6 hours",
        "6 - 8 ساعة": "6 - 8 hours",
        "اكثر من 8 ساعات": "More than 8 hours"
    },
    "كم عدد الساعات التي تقضيها يوميًا على وسائل التواصل الاجتماعي؟": {
        "اقل من ساعة": "Less than 1 hour",
        "1 – 3 ساعة": "1 – 3 hours",
        "3 – 5 ساعة": "3 – 5 hours",
        "5 – 7 ساعة": "5 – 7 hours",
        "اكثر من 7 ساعات": "More than 7 hours"
    },
    "هل تمارس أي نوع من التمارين البدنية بانتظام؟": {
        "نعم": "Yes",
        "لا": "No",
        "كنت ألعب وتوقفت": "I was playing and I stopped"
    },
    "في المتوسط، كم ساعة تنام في الليلة؟": {
        "اقل من 5 ساعات": "Less than 5 hours",
        "5 – 6 ساعة": "5 – 6 hours",
        "6 – 7 ساعة": "6 – 7 hours",
        "7 – 8 ساعة": "7 – 8 hours",
        "اكثر من 8 ساعات": "More than 8 hours"
    },
    "هل تفحص هاتفك فور الاستيقاظ؟": {
        "دائمًا": "Always",
        "أحيانًا": "Sometimes",
        "أبدًا": "Never"
    },
    "هل ذكر الناس من حولك أنك تبدو أكثر انزعاجًا أو توترًا مؤخرًا؟ (سريع الغضب)": {
        "نعم": "Yes",
        "لا": "No",
        "انا لا اعرف": "i don't know"
    },
    "ما هو وضعك الوظيفي الحالي؟": {
        "طالب": "Student",
        "موظف": "Employed",
        "كلاهما": "Both"
    },
    "أي التطبيقات تستهلك معظم وقتك؟": {
        "Facebook": "Facebook",
        "Instagram": "Instagram",
        "WhatsApp": "WhatsApp",
        "Snapchat": "Snapchat",
        "Twitter": "Twitter",
        "Tiktok": "Tiktok",
        "Youtube": "Youtube"
    },
    "في أي نقطة تقرر عادةً تخطي فيديو متعلق بالصحة العقلية/التوعية؟": {
        "ضمن الخمس إلى عشر ثوانٍ الأولى (مرحلة الجذب).": "Within the first 5-10 seconds (Hook stage).",
        "إذا كان المحتوى يبدو متكرراً أو بطيئاً الإيقاع.": "If the content feels repetitive or slow-paced.",
        "نادراً ما أتخطى إذا كان الموضوع يتوافق مع اهتماماتي الحالية.": "I rarely skip if the topic matches my current interests."
    },
    "أي نوع من تنسيقات المحتوى تجده أكثر جاذبية وأقل احتمالًا لتجاوزه؟": {
        "فيديوهات قصيرة (ريلز/تيك توك) مع نصائح سريعة.": "Short-form videos (Reels/TikToks) with quick tips.",
        "مقاطع فيديو تعليمية طويلة / بودكاست.": "Long-form educational videos/Podcasts.",
        "السرد الشخصي والتجارب الواقعية": "Personal storytelling and real-life experiences."
    },
    "كم مرة تجد نفسك تقوم بـ\"التصفح المظلم\" (تغيير الفيديوهات بسرعة) عندما تشعر بالتوتر أو القلق؟": {
        "دائماً (سلوك متكرر)": "Always (Habitual behavior).",
        "غالبًا (يعتمد على مزاجي).": "Frequently (Depends on my mood).",
        "أحيانًا (فقط عند الملل).": "Occasionally (Only when bored)."
    },
    "ما هو العامل الأساسي الذي يمنعك من تخطي فيديو تعليمي؟": {
        "جودة بصرية ورسوم متحركة.": "Visual quality and motion graphics.",
        "نبرة المتحدث وأسلوب تقديمه.": "The speaker’s tone and delivery style.",
        "استخدام إحصاءات ونقاط بيانات واضحة.": "Use of clear statistics and data points.",
        "وجود ترجمات وعناوين واضحة على الشاشة.": "Presence of subtitles and clear on-screen headings."
    },
    "هل يمنعك استخدام عناصر بصرية مهدئة (ألوان، طبيعة، تصميم بسيط) من تخطي فيديو الصحة النفسية؟": {
        "نعم، بشكل كبير": "Yes, significantly ",
        "لا، المحتوى أهم": "No, content matters more"
    }
}

def translate_and_merge_data():
    try:
        # 3. Load both files
        print("Status: Loading Arabic and English files...")
        df_arabic = pd.read_excel(arabic_file_path)
        df_english = pd.read_excel(english_file_path)

        # 4. Apply Translation to the Arabic file
        print("Status: Translating Arabic content...")
        df_arabic.replace(translation_dict, inplace=True)

        # 5. Unify Headers
        # Replaces the Arabic headers with the English headers to ensure a clean merge
        print("Status: Aligning headers for merge...")
        if len(df_arabic.columns) == len(df_english.columns):
            df_arabic.columns = df_english.columns
        else:
            print("Warning: The number of columns in the two files is not equal. The merge may be inaccurate.")

        # 6. Merge Dataframes
        # Appends the translated Arabic data directly beneath the English data
        print("Status: Merging datasets into one table...")
        combined_df = pd.concat([df_english, df_arabic], ignore_index=True)

        # 7. Export the final combined file
        combined_df.to_excel(final_output_path, index=False)
        print(f"Success: Translation and merge complete. File saved at: {final_output_path}")

    except Exception as e:
        print(f"Error: {e}")

# Execute the process
if __name__ == "__main__":
    translate_and_merge_data()