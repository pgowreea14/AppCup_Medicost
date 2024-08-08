import 'package:flutter/material.dart';

class Predictor extends StatefulWidget {
  @override
  _PredictorState createState() => _PredictorState();
}

class _PredictorState extends State<Predictor> {
  final _symptomController = TextEditingController();
  String _result = '';

  final List<Map<String, dynamic>> _diseaseData = [
    {
      "Disease": "Influenza",
      "Symptoms": [
        "Fever",
        "Cough",
        "Sore Throat",
        "Fatigue",
        "Body Aches",
        "Headache",
        "Chills",
        "Congestion",
        "Runny Nose",
        "Muscle Pain"
      ]
    },
    {
      "Disease": "Common Cold",
      "Symptoms": [
        "Runny Nose",
        "Sneezing",
        "Sore Throat",
        "Cough",
        "Mild Fever",
        "Headache",
        "Fatigue",
        "Nasal Congestion",
        "Watery Eyes"
      ]
    },
    {
      "Disease": "Tuberculosis",
      "Symptoms": [
        "Cough",
        "Weight Loss",
        "Night Sweats",
        "Fever",
        "Chest Pain",
        "Fatigue",
        "Loss of Appetite",
        "Coughing Up Blood",
        "Shortness of Breath"
      ]
    },
    {
      "Disease": "Diabetes",
      "Symptoms": [
        "Excessive Thirst",
        "Frequent Urination",
        "Fatigue",
        "Blurred Vision",
        "Slow-Healing Sores",
        "Unexplained Weight Loss",
        "Numbness",
        "Frequent Infections",
        "Dry Skin"
      ]
    },
    {
      "Disease": "Chikungunya",
      "Symptoms": [
        "Fever",
        "Joint Pain",
        "Rash",
        "Muscle Pain",
        "Headache",
        "Fatigue",
        "Back Pain",
        "Nausea",
        "Vomiting",
        "Swollen Joints"
      ]
    },
    {
      "Disease": "Asthma",
      "Symptoms": [
        "Wheezing",
        "Shortness of Breath",
        "Cough",
        "Chest Tightness",
        "Frequent Respiratory Infections",
        "Difficulty Breathing",
        "Fatigue",
        "Sore Throat",
        "Runny Nose"
      ]
    },
    {
      "Disease": "Heart Disease",
      "Symptoms": [
        "Chest Pain",
        "Shortness of Breath",
        "Fatigue",
        "Dizziness",
        "Nausea",
        "Sweating",
        "Palpitations",
        "Swelling in Legs",
        "Irregular Heartbeat"
      ]
    },
    {
      "Disease": "Allergies",
      "Symptoms": [
        "Sneezing",
        "Itchy Eyes",
        "Runny Nose",
        "Congestion",
        "Cough",
        "Rash",
        "Hives",
        "Itchy Skin",
        "Swelling",
        "Fatigue"
      ]
    },
    {
      "Disease": "Pneumonia",
      "Symptoms": [
        "Cough",
        "Fever",
        "Shortness of Breath",
        "Chest Pain",
        "Fatigue",
        "Confusion",
        "Chills",
        "Nausea",
        "Vomiting",
        "Diarrhea"
      ]
    },
    {
      "Disease": "Gastroenteritis",
      "Symptoms": [
        "Nausea",
        "Vomiting",
        "Diarrhea",
        "Abdominal Pain",
        "Cramps",
        "Fever",
        "Headache",
        "Muscle Aches",
        "Fatigue",
        "Loss of Appetite"
      ]
    },
    {
      "Disease": "Arthritis",
      "Symptoms": [
        "Joint Pain",
        "Swelling",
        "Stiffness",
        "Reduced Range of Motion",
        "Warmth Around Joints",
        "Redness",
        "Fatigue",
        "Fever",
        "Weight Loss"
      ]
    },
    {
      "Disease": "Migraine",
      "Symptoms": [
        "Severe Headache",
        "Nausea",
        "Vomiting",
        "Sensitivity to Light",
        "Sensitivity to Sound",
        "Visual Disturbances",
        "Aura",
        "Dizziness",
        "Fatigue"
      ]
    },
    {
      "Disease": "Hypertension",
      "Symptoms": [
        "Headache",
        "Shortness of Breath",
        "Nosebleeds",
        "Fatigue",
        "Dizziness",
        "Chest Pain",
        "Irregular Heartbeat",
        "Visual Changes",
        "Confusion"
      ]
    },
    {
      "Disease": "Sinusitis",
      "Symptoms": [
        "Nasal Congestion",
        "Facial Pain",
        "Headache",
        "Runny Nose",
        "Cough",
        "Post-Nasal Drip",
        "Fever",
        "Bad Breath",
        "Fatigue"
      ]
    },
    {
      "Disease": "Chronic Obstructive Pulmonary Disease (COPD)",
      "Symptoms": [
        "Sudden Chest Pain",
        "Shortness of Breath",
        "Rapid Breathing",
        "Cyanosis",
        "Decreased Breath Sounds",
        "Chest Tightness",
        "Fatigue",
        "Cough",
        "Anxiety"
      ]
    },
    {
      "Disease": "Pneumothorax",
      "Symptoms": [
        "Jaundice",
        "Fatigue",
        "Abdominal Pain",
        "Loss of Appetite",
        "Nausea",
        "Vomiting",
        "Dark Urine",
        "Light-Colored Stools",
        "Joint Pain"
      ]
    },
    {
      "Disease": "Hepatitis",
      "Symptoms": [
        "Abdominal Pain",
        "Nausea",
        "Vomiting",
        "Loss of Appetite",
        "Weight Loss",
        "Bloating",
        "Belching",
        "Heartburn",
        "Dark Stools"
      ]
    },
    {
      "Disease": "Peptic Ulcer",
      "Symptoms": [
        "Weight Changes",
        "Fatigue",
        "Hair Loss",
        "Cold Intolerance",
        "Heat Intolerance",
        "Tremors",
        "Palpitations",
        "Mood Swings",
        "Constipation"
      ]
    },
    {
      "Disease": "Thyroid Disorders",
      "Symptoms": [
        "Seizures",
        "Uncontrolled Movements",
        "Loss of Consciousness",
        "Aura",
        "Confusion",
        "Memory Lapses",
        "Muscle Spasms",
        "Staring Spells",
        "Tingling Sensations"
      ]
    },
    {
      "Disease": "Epilepsy",
      "Symptoms": [
        "Fatigue",
        "Numbness",
        "Difficulty Walking",
        "Muscle Weakness",
        "Vision Problems",
        "Dizziness",
        "Tremors",
        "Cognitive Changes",
        "Bladder Dysfunction"
      ]
    },
    {
      "Disease": "Multiple Sclerosis",
      "Symptoms": [
        "Tremors",
        "Muscle Rigidity",
        "Bradykinesia (Slow Movement)",
        "Postural Instability",
        "Shuffling Walk",
        "Balance Problems",
        "Difficulty with Fine Motor Skills",
        "Reduced Facial Expression",
        "Speech Changes"
      ]
    },
    {
      "Disease": "Parkinson's Disease",
      "Symptoms": [
        "Loud Snoring",
        "Excessive Daytime Sleepiness",
        "Pauses in Breathing",
        "Gasping During Sleep",
        "Dry Mouth",
        "Sore Throat",
        "Morning Headache",
        "Difficulty Concentrating",
        "Irritability",
        "Insomnia"
      ]
    },
    {
      "Disease": "Sleep Apnea",
      "Symptoms": [
        "Abdominal Pain",
        "Diarrhea",
        "Weight Loss",
        "Fatigue",
        "Bloating",
        "Gas",
        "Joint Pain",
        "Skin Rash",
        "Bone Pain"
      ]
    },
    {
      "Disease": "Crohn's Disease",
      "Symptoms": [
        "Abdominal Pain",
        "Diarrhea",
        "Weight Loss",
        "Fatigue",
        "Bloating",
        "Gas",
        "Joint Pain",
        "Skin Rash",
        "Bone Pain"
      ]
    },
    {
      "Disease": "Ulcerative Colitis",
      "Symptoms": [
        "Abdominal Pain",
        "Bloody Diarrhea",
        "Urgency to Have Bowel Movements",
        "Weight Loss",
        "Fatigue",
        "Loss of Appetite",
        "Fever",
        "Rectal Pain",
        "Anemia"
      ]
    },
    {
      "Disease": "Celiac Disease",
      "Symptoms": [
        "Abdominal Pain",
        "Diarrhea",
        "Weight Loss",
        "Fatigue",
        "Bloating",
        "Gas",
        "Joint Pain",
        "Skin Rash",
        "Bone Pain"
      ]
    },
    {
      "Disease": "Sjögren's Syndrome",
      "Symptoms": [
        "Dry Mouth",
        "Dry Eyes",
        "Joint Pain",
        "Fatigue",
        "Swollen Glands",
        "Skin Rash",
        "Difficulty Swallowing",
        "Vaginal Dryness",
        "Persistent Cough",
        "Muscle Aches"
      ]
    },
    {
      "Disease": "Systemic Lupus Erythematosus",
      "Symptoms": [
        "Fatigue",
        "Joint Pain",
        "Skin Rash",
        "Fever",
        "Weight Loss",
        "Hair Loss",
        "Photosensitivity",
        "Mouth Sores",
        "Raynaud's Phenomenon",
        "Chest Pain"
      ]
    },
    {
      "Disease": "Fibromyalgia",
      "Symptoms": [
        "Widespread Pain",
        "Fatigue",
        "Sleep Disturbances",
        "Stiffness",
        "Tender Points",
        "Cognitive Difficulties",
        "Headaches",
        "Irritable Bowel Syndrome",
        "Numbness",
        "Sensitivity to Touch"
      ]
    },
    {
      "Disease": "Rheumatoid Arthritis",
      "Symptoms": [
        "Joint Pain",
        "Swelling",
        "Stiffness",
        "Redness",
        "Warmth Around Joints",
        "Fatigue",
        "Fever",
        "Weight Loss",
        "Loss of Joint Function",
        "Nodules"
      ]
    },
    {
      "Disease": "Gout",
      "Symptoms": [
        "Intense Joint Pain",
        "Redness",
        "Swelling",
        "Tenderness",
        "Warmth",
        "Limited Range of Motion",
        "Fever",
        "Tophi (Lumps)",
        "Chills",
        "Persistent Pain"
      ]
    },
    {
      "Disease": "Psoriasis",
      "Symptoms": [
        "Red Patches of Skin",
        "Silvery Scales",
        "Itching",
        "Dry Skin",
        "Cracked Skin",
        "Swollen Joints",
        "Nail Changes",
        "Scaling",
        "Burning Sensation",
        "Joint Pain"
      ]
    },
    {
      "Disease": "Eczema",
      "Symptoms": [
        "Itchy Skin",
        "Red Rash",
        "Dry Skin",
        "Swelling",
        "Blisters",
        "Crusting",
        "Thickened Skin",
        "Skin Infections",
        "Discoloration",
        "Scaly Patches"
      ]
    },
    {
      "Disease": "Vitiligo",
      "Symptoms": [
        "Skin Depigmentation",
        "White Patches",
        "Loss of Skin Color",
        "Change in Skin Texture",
        "Uneven Skin Tone",
        "Hair Whitening",
        "Sensitivity to Sunlight",
        "Skin Irritation",
        "Unusual Skin Color",
        "Spots"
      ]
    },
    {
      "Disease": "Alopecia Areata",
      "Symptoms": [
        "Sudden Hair Loss",
        "Round Bald Patches",
        "Patchy Hair Loss",
        "Itching or Burning",
        "Hair Thinning",
        "Small Bald Spots",
        "Nail Changes",
        "Loss of Eyebrows",
        "Loss of Eyelashes",
        "Regrowth of Hair"
      ]
    },
    {
      "Disease": "Scabies",
      "Symptoms": [
        "Itchy Skin",
        "Rash",
        "Burrows in Skin",
        "Sores",
        "Redness",
        "Swelling",
        "Crusting",
        "Blisters",
        "Thickened Skin",
        "Skin Infections"
      ]
    },
    {
      "Disease": "Ringworm",
      "Symptoms": [
        "Ring-Shaped Rash",
        "Red, Itchy Skin",
        "Scaling",
        "Blisters",
        "Hair Loss",
        "Fungal Infection",
        "Circular Patches",
        "Dryness",
        "Crusting",
        "Discoloration"
      ]
    },
    {
      "Disease": "Lupus",
      "Symptoms": [
        "Fatigue",
        "Joint Pain",
        "Skin Rash",
        "Fever",
        "Weight Loss",
        "Hair Loss",
        "Photosensitivity",
        "Mouth Sores",
        "Raynaud's Phenomenon",
        "Chest Pain"
      ]
    },
    {
      "Disease": "Leukemia",
      "Symptoms": [
        "Fatigue",
        "Fever",
        "Easy Bruising",
        "Weight Loss",
        "Frequent Infections",
        "Swollen Lymph Nodes",
        "Pale Skin",
        "Shortness of Breath",
        "Bone Pain",
        "Abdominal Pain"
      ]
    },
    {
      "Disease": "Lymphoma",
      "Symptoms": [
        "Swollen Lymph Nodes",
        "Fever",
        "Night Sweats",
        "Weight Loss",
        "Fatigue",
        "Itching",
        "Abdominal Pain",
        "Chest Pain",
        "Loss of Appetite",
        "Difficulty Breathing"
      ]
    },
    {
      "Disease": "Myeloma",
      "Symptoms": [
        "Bone Pain",
        "Fatigue",
        "Frequent Infections",
        "Kidney Problems",
        "High Calcium Levels",
        "Unexplained Weight Loss",
        "Anemia",
        "Weakness",
        "Nausea",
        "Constipation"
      ]
    },
    {
      "Disease": "Multiple Myeloma",
      "Symptoms": [
        "Bone Pain",
        "Fatigue",
        "Frequent Infections",
        "Kidney Problems",
        "High Calcium Levels",
        "Unexplained Weight Loss",
        "Anemia",
        "Weakness",
        "Nausea",
        "Constipation"
      ]
    },
    {
      "Disease": "Ovarian Cancer",
      "Symptoms": [
        "Abdominal Bloating",
        "Pelvic Pain",
        "Frequent Urination",
        "Difficulty Eating",
        "Feeling Full Quickly",
        "Abdominal Pain",
        "Fatigue",
        "Back Pain",
        "Changes in Menstrual Cycle",
        "Unexplained Weight Loss"
      ]
    },
    {
      "Disease": "Breast Cancer",
      "Symptoms": [
        "Lump in Breast",
        "Change in Breast Shape",
        "Nipple Discharge",
        "Skin Changes",
        "Swelling",
        "Redness",
        "Pain in Breast",
        "Nipple Retraction",
        "Swollen Lymph Nodes",
        "Rash"
      ]
    },
    {
      "Disease": "Prostate Cancer",
      "Symptoms": [
        "Difficulty Urinating",
        "Blood in Urine",
        "Painful Urination",
        "Frequent Urination",
        "Weak Urine Stream",
        "Pain in Pelvic Area",
        "Erectile Dysfunction",
        "Lower Back Pain",
        "Bone Pain",
        "Unexplained Weight Loss"
      ]
    },
    {
      "Disease": "Testicular Cancer",
      "Symptoms": [
        "Lump in Testicle",
        "Swelling",
        "Pain or Discomfort",
        "Change in Testicle Size",
        "Heavy Feeling",
        "Abdominal Pain",
        "Back Pain",
        "Tenderness",
        "Nausea",
        "Fever"
      ]
    },
    {
      "Disease": "Kidney Cancer",
      "Symptoms": [
        "Blood in Urine",
        "Back Pain",
        "Weight Loss",
        "Fatigue",
        "Frequent Urination",
        "Pain in Side",
        "Swelling in Abdomen",
        "Fever",
        "Loss of Appetite",
        "Persistent Cough"
      ]
    },
    {
      "Disease": "Bladder Cancer",
      "Symptoms": [
        "Blood in Urine",
        "Frequent Urination",
        "Painful Urination",
        "Lower Back Pain",
        "Pelvic Pain",
        "Urinary Urgency",
        "Weight Loss",
        "Fatigue",
        "Abdominal Pain",
        "Swelling"
      ]
    },
    {
      "Disease": "Melanoma",
      "Symptoms": [
        "Change in Skin Moles",
        "New Growths",
        "Itching",
        "Bleeding",
        "Pain",
        "Change in Mole Color",
        "Irregular Mole Borders",
        "Redness Around Mole",
        "Swelling",
        "Crusting"
      ]
    },
    {
      "Disease": "Basal Cell Carcinoma",
      "Symptoms": [
        "Pearly White Bumps",
        "Red, Scaly Patches",
        "Bleeding Sores",
        "Ulcerated Growths",
        "Itching",
        "Pain",
        "Changes in Skin Texture",
        "Crusting",
        "Swelling",
        "Discoloration"
      ]
    },
    {
      "Disease": "Squamous Cell Carcinoma",
      "Symptoms": [
        "Red Nodules",
        "Scaly Patches",
        "Bleeding Sores",
        "Ulcerated Growths",
        "Crusting",
        "Pain",
        "Itching",
        "Swelling",
        "Change in Skin Texture",
        "Discoloration"
      ]
    },
    {
      "Disease": "Acne",
      "Symptoms": [
        "Pimples",
        "Blackheads",
        "Whiteheads",
        "Redness",
        "Inflammation",
        "Swelling",
        "Cysts",
        "Scarring",
        "Oily Skin",
        "Blackheads"
      ]
    },
    {
      "Disease": "Rosacea",
      "Symptoms": [
        "Redness",
        "Facial Flushing",
        "Visible Blood Vessels",
        "Acne-Like Breakouts",
        "Thickened Skin",
        "Eye Irritation",
        "Swelling",
        "Burning Sensation",
        "Dryness",
        "Sensitivity"
      ]
    },
    {
      "Disease": "Dermatitis",
      "Symptoms": [
        "Red, Itchy Skin",
        "Swelling",
        "Rash",
        "Blisters",
        "Crusting",
        "Dryness",
        "Scaliness",
        "Flaking",
        "Burning Sensation",
        "Cracking"
      ]
    },
    {
      "Disease": "Psoriasis",
      "Symptoms": [
        "Red Patches of Skin",
        "Silvery Scales",
        "Itching",
        "Dry Skin",
        "Cracked Skin",
        "Swollen Joints",
        "Nail Changes",
        "Scaling",
        "Burning Sensation",
        "Joint Pain"
      ]
    },
    {
      "Disease": "Eczema",
      "Symptoms": [
        "Itchy Skin",
        "Red Rash",
        "Dry Skin",
        "Swelling",
        "Blisters",
        "Crusting",
        "Thickened Skin",
        "Skin Infections",
        "Discoloration",
        "Scaly Patches"
      ]
    },
    {
      "Disease": "Vitiligo",
      "Symptoms": [
        "Skin Depigmentation",
        "White Patches",
        "Loss of Skin Color",
        "Change in Skin Texture",
        "Uneven Skin Tone",
        "Hair Whitening",
        "Sensitivity to Sunlight",
        "Skin Irritation",
        "Unusual Skin Color",
        "Spots"
      ]
    },
    {
      "Disease": "Alopecia Areata",
      "Symptoms": [
        "Sudden Hair Loss",
        "Round Bald Patches",
        "Patchy Hair Loss",
        "Itching or Burning",
        "Hair Thinning",
        "Small Bald Spots",
        "Nail Changes",
        "Loss of Eyebrows",
        "Loss of Eyelashes",
        "Regrowth of Hair"
      ]
    },
    {
      "Disease": "Scabies",
      "Symptoms": [
        "Itchy Skin",
        "Rash",
        "Burrows in Skin",
        "Sores",
        "Redness",
        "Swelling",
        "Crusting",
        "Blisters",
        "Thickened Skin",
        "Skin Infections"
      ]
    },
    {
      "Disease": "Ringworm",
      "Symptoms": [
        "Ring-Shaped Rash",
        "Red, Itchy Skin",
        "Scaling",
        "Blisters",
        "Hair Loss",
        "Fungal Infection",
        "Circular Patches",
        "Dryness",
        "Crusting",
        "Discoloration"
      ]
    },
    {
      "Disease": "Lupus",
      "Symptoms": [
        "Fatigue",
        "Joint Pain",
        "Skin Rash",
        "Fever",
        "Weight Loss",
        "Hair Loss",
        "Photosensitivity",
        "Mouth Sores",
        "Raynaud's Phenomenon",
        "Chest Pain"
      ]
    },
    {
      "Disease": "Leukemia",
      "Symptoms": [
        "Fatigue",
        "Fever",
        "Easy Bruising",
        "Weight Loss",
        "Frequent Infections",
        "Swollen Lymph Nodes",
        "Pale Skin",
        "Shortness of Breath",
        "Bone Pain",
        "Abdominal Pain"
      ]
    },
    {
      "Disease": "Lymphoma",
      "Symptoms": [
        "Swollen Lymph Nodes",
        "Fever",
        "Night Sweats",
        "Weight Loss",
        "Fatigue",
        "Itching",
        "Abdominal Pain",
        "Chest Pain",
        "Loss of Appetite",
        "Difficulty Breathing"
      ]
    },
    {
      "Disease": "Myeloma",
      "Symptoms": [
        "Bone Pain",
        "Fatigue",
        "Frequent Infections",
        "Kidney Problems",
        "High Calcium Levels",
        "Unexplained Weight Loss",
        "Anemia",
        "Weakness",
        "Nausea",
        "Constipation"
      ]
    },
    {
      "Disease": "Multiple Myeloma",
      "Symptoms": [
        "Bone Pain",
        "Fatigue",
        "Frequent Infections",
        "Kidney Problems",
        "High Calcium Levels",
        "Unexplained Weight Loss",
        "Anemia",
        "Weakness",
        "Nausea",
        "Constipation"
      ]
    },
    {
      "Disease": "Ovarian Cancer",
      "Symptoms": [
        "Abdominal Bloating",
        "Pelvic Pain",
        "Frequent Urination",
        "Difficulty Eating",
        "Feeling Full Quickly",
        "Abdominal Pain",
        "Fatigue",
        "Back Pain",
        "Changes in Menstrual Cycle",
        "Unexplained Weight Loss"
      ]
    },
    {
      "Disease": "Breast Cancer",
      "Symptoms": [
        "Lump in Breast",
        "Change in Breast Shape",
        "Nipple Discharge",
        "Skin Changes",
        "Swelling",
        "Redness",
        "Pain in Breast",
        "Nipple Retraction",
        "Swollen Lymph Nodes",
        "Rash"
      ]
    },
    {
      "Disease": "Prostate Cancer",
      "Symptoms": [
        "Difficulty Urinating",
        "Blood in Urine",
        "Painful Urination",
        "Frequent Urination",
        "Weak Urine Stream",
        "Pain in Pelvic Area",
        "Erectile Dysfunction",
        "Lower Back Pain",
        "Bone Pain",
        "Unexplained Weight Loss"
      ]
    },
    {
      "Disease": "Testicular Cancer",
      "Symptoms": [
        "Lump in Testicle",
        "Swelling",
        "Pain or Discomfort",
        "Change in Testicle Size",
        "Heavy Feeling",
        "Abdominal Pain",
        "Back Pain",
        "Tenderness",
        "Nausea",
        "Fever"
      ]
    },
    {
      "Disease": "Kidney Cancer",
      "Symptoms": [
        "Blood in Urine",
        "Back Pain",
        "Weight Loss",
        "Fatigue",
        "Frequent Urination",
        "Pain in Side",
        "Swelling in Abdomen",
        "Fever",
        "Loss of Appetite",
        "Persistent Cough"
      ]
    },
    {
      "Disease": "Bladder Cancer",
      "Symptoms": [
        "Blood in Urine",
        "Frequent Urination",
        "Painful Urination",
        "Lower Back Pain",
        "Pelvic Pain",
        "Urinary Urgency",
        "Weight Loss",
        "Fatigue",
        "Abdominal Pain",
        "Swelling"
      ]
    },
    {
      "Disease": "Melanoma",
      "Symptoms": [
        "Change in Skin Moles",
        "New Growths",
        "Itching",
        "Bleeding",
        "Pain",
        "Change in Mole Color",
        "Irregular Mole Borders",
        "Redness Around Mole",
        "Swelling",
        "Crusting"
      ]
    },
    {
      "Disease": "Basal Cell Carcinoma",
      "Symptoms": [
        "Pearly White Bumps",
        "Red, Scaly Patches",
        "Bleeding Sores",
        "Ulcerated Growths",
        "Itching",
        "Pain",
        "Changes in Skin Texture",
        "Crusting",
        "Swelling",
        "Discoloration"
      ]
    },
    {
      "Disease": "Squamous Cell Carcinoma",
      "Symptoms": [
        "Red Nodules",
        "Scaly Patches",
        "Bleeding Sores",
        "Ulcerated Growths",
        "Crusting",
        "Pain",
        "Itching",
        "Swelling",
        "Change in Skin Texture",
        "Discoloration"
      ]
    }
  ];

  void _predictDisease() {
    final inputSymptoms =
        _symptomController.text.split(',').map((s) => s.trim()).toList();
    final matchedDiseases = <String>[];

    for (var disease in _diseaseData) {
      final diseaseName = disease['Disease'];
      final diseaseSymptoms = List<String>.from(disease['Symptoms']);

      // Check if the input symptoms match the disease symptoms
      if (inputSymptoms.every((symptom) => diseaseSymptoms.contains(symptom))) {
        matchedDiseases.add(diseaseName);
      }
    }

    setState(() {
      _result = matchedDiseases.isEmpty
          ? 'No matching diseases found'
          : 'Possible Diseases: ${matchedDiseases.join(', ')}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disease Predictor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _symptomController,
              decoration: InputDecoration(
                labelText: 'Enter symptoms (comma separated)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _predictDisease,
              child: Text('Predict Disease'),
            ),
            SizedBox(height: 16.0),
            Text(
              _result,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
