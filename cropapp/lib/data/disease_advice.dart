// lib/data/disease_advice.dart

class DiseaseInfo {
  final String displayName;
  final String plant;
  final String condition;
  final bool isHealthy;
  final String description;
  final List<String> symptoms;
  final List<String> treatments;
  final List<String> prevention;
  final String severity; // 'low', 'medium', 'high'

  const DiseaseInfo({
    required this.displayName,
    required this.plant,
    required this.condition,
    required this.isHealthy,
    required this.description,
    required this.symptoms,
    required this.treatments,
    required this.prevention,
    required this.severity,
  });
}

const Map<String, DiseaseInfo> diseaseAdvice = {
  // ─── APPLE ───────────────────────────────────────────────────────────────────
  'Apple___Apple_scab': DiseaseInfo(
    displayName: 'Apple Scab',
    plant: 'Apple',
    condition: 'Apple Scab',
    isHealthy: false,
    severity: 'medium',
    description:
        'Apple scab is a fungal disease caused by Venturia inaequalis. It is one of the most common and damaging apple diseases worldwide, thriving in cool, wet spring weather.',
    symptoms: [
      'Olive-green to brown velvety spots on leaves',
      'Scabby, corky lesions on fruit surface',
      'Distorted or cracked fruit in severe cases',
      'Early defoliation in heavily infected trees',
    ],
    treatments: [
      'Apply fungicides containing captan, myclobutanil, or mancozeb',
      'Begin sprays at green tip stage and repeat every 7–10 days during wet weather',
      'Remove and destroy fallen infected leaves to reduce overwintering spores',
      'Prune trees to improve air circulation',
    ],
    prevention: [
      'Plant scab-resistant apple varieties (e.g., Liberty, Enterprise)',
      'Rake and compost or destroy fallen leaves in autumn',
      'Avoid overhead irrigation; use drip systems',
      'Maintain proper tree spacing for airflow',
    ],
  ),

  'Apple___Black_rot': DiseaseInfo(
    displayName: 'Apple Black Rot',
    plant: 'Apple',
    condition: 'Black Rot',
    isHealthy: false,
    severity: 'high',
    description:
        'Black rot is caused by the fungus Botryosphaeria obtusa. It attacks fruit, leaves, and bark, and can cause significant crop losses if left unmanaged.',
    symptoms: [
      'Small purple spots on leaves that enlarge with yellow halos',
      'Brown to black rotting of fruit starting from the calyx end',
      'Mummified fruits hanging on the tree',
      'Cankers with rough, cracked bark on branches',
    ],
    treatments: [
      'Apply fungicides (captan, thiophanate-methyl) starting at petal fall',
      'Prune out dead or cankered wood 15 cm below visible infection',
      'Remove and destroy mummified fruits',
      'Sterilize pruning tools between cuts with 70% alcohol',
    ],
    prevention: [
      'Remove all dead wood and mummified fruits during dormant season',
      'Avoid wounding the bark during cultivation',
      'Maintain tree vigor with balanced fertilization',
      'Ensure good air circulation by proper pruning',
    ],
  ),

  'Apple___Cedar_apple_rust': DiseaseInfo(
    displayName: 'Cedar Apple Rust',
    plant: 'Apple',
    condition: 'Cedar Apple Rust',
    isHealthy: false,
    severity: 'medium',
    description:
        'Cedar apple rust is a fungal disease requiring two hosts: apple/crabapple and eastern red cedar (juniper). It causes bright orange-yellow spots on apple leaves and fruit.',
    symptoms: [
      'Bright orange-yellow spots on upper leaf surface',
      'Tube-like structures (aecia) on the underside of leaves',
      'Deformed or spotted fruit',
      'Orange, gelatinous galls on nearby cedar/juniper trees in spring',
    ],
    treatments: [
      'Apply myclobutanil or propiconazole fungicides from pink bud stage through early summer',
      'Remove cedar galls from nearby juniper trees before they release spores',
      'Use protectant fungicides preventively during spring',
    ],
    prevention: [
      'Plant rust-resistant apple varieties',
      'Remove eastern red cedars within a 1 km radius if possible',
      'Apply preventive fungicide sprays during wet spring weather',
      'Monitor cedar trees for orange galls and remove before spring rain',
    ],
  ),

  'Apple___healthy': DiseaseInfo(
    displayName: 'Healthy Apple',
    plant: 'Apple',
    condition: 'Healthy',
    isHealthy: true,
    severity: 'low',
    description:
        'Your apple plant appears healthy! The leaves show no signs of disease, discoloration, or pest damage.',
    symptoms: [],
    treatments: [],
    prevention: [
      'Water at the base; avoid wetting foliage',
      'Fertilize in spring with a balanced NPK fertilizer',
      'Prune annually during dormancy to maintain shape and airflow',
      'Monitor regularly for early signs of pests or disease',
      'Apply dormant oil spray in late winter to control overwintering pests',
    ],
  ),

  // ─── BLUEBERRY ────────────────────────────────────────────────────────────────
  'Blueberry___healthy': DiseaseInfo(
    displayName: 'Healthy Blueberry',
    plant: 'Blueberry',
    condition: 'Healthy',
    isHealthy: true,
    severity: 'low',
    description:
        'Your blueberry plant looks healthy! Continue with good cultural practices to maintain its vigor.',
    symptoms: [],
    treatments: [],
    prevention: [
      'Maintain soil pH between 4.5 and 5.5 for optimal growth',
      'Mulch with pine bark or sawdust to retain moisture and suppress weeds',
      'Prune out old, unproductive canes each year',
      'Use drip irrigation to avoid wetting foliage',
      'Monitor for mummy berry and leaf spot diseases annually',
    ],
  ),

  // ─── CHERRY ──────────────────────────────────────────────────────────────────
  'Cherry_(including_sour)___Powdery_mildew': DiseaseInfo(
    displayName: 'Cherry Powdery Mildew',
    plant: 'Cherry',
    condition: 'Powdery Mildew',
    isHealthy: false,
    severity: 'medium',
    description:
        'Powdery mildew in cherry is caused by Podosphaera clandestina. It coats leaves and young shoots with a white powdery growth, reducing photosynthesis and fruit quality.',
    symptoms: [
      'White powdery coating on young leaves and shoots',
      'Curling or distortion of infected leaves',
      'Stunted shoot growth',
      'Reduced fruit size and quality',
    ],
    treatments: [
      'Apply sulfur-based or potassium bicarbonate fungicides at first sign',
      'Use myclobutanil or trifloxystrobin for systemic control',
      'Remove and destroy heavily infected shoots',
      'Avoid excessive nitrogen fertilization which promotes lush growth',
    ],
    prevention: [
      'Plant resistant cherry varieties where available',
      'Prune to open the canopy and improve airflow',
      'Avoid overhead irrigation',
      'Apply preventive fungicide sprays during periods of rapid shoot growth',
    ],
  ),

  'Cherry_(including_sour)___healthy': DiseaseInfo(
    displayName: 'Healthy Cherry',
    plant: 'Cherry',
    condition: 'Healthy',
    isHealthy: true,
    severity: 'low',
    description:
        'Your cherry plant is in excellent health. Keep up the good work!',
    symptoms: [],
    treatments: [],
    prevention: [
      'Prune to maintain an open canopy for light and air circulation',
      'Water regularly but avoid waterlogging',
      'Apply balanced fertilizer in early spring',
      'Protect fruit from birds with netting',
      'Inspect regularly for brown rot and leaf spot',
    ],
  ),

  // ─── CORN ────────────────────────────────────────────────────────────────────
  'Corn_(maize)___Cercospora_leaf_spot Gray_leaf_spot': DiseaseInfo(
    displayName: 'Corn Gray Leaf Spot',
    plant: 'Corn (Maize)',
    condition: 'Gray Leaf Spot (Cercospora)',
    isHealthy: false,
    severity: 'high',
    description:
        'Gray leaf spot (GLS), caused by Cercospora zeae-maydis, is one of the most yield-limiting diseases of corn worldwide. It thrives in warm, humid conditions with extended leaf wetness.',
    symptoms: [
      'Long, rectangular lesions parallel to leaf veins',
      'Lesions initially appear tan/gray with yellow halos',
      'Lesions coalesce in severe cases, killing large leaf areas',
      'Most severe in lower canopy leaves first',
    ],
    treatments: [
      'Apply strobilurin or triazole fungicides at VT/R1 (tasseling/silking) growth stage',
      'Rotate crops — avoid corn-on-corn planting',
      'Till under crop residue to reduce inoculum',
    ],
    prevention: [
      'Plant resistant or tolerant hybrid varieties',
      'Rotate with non-host crops (soybean, small grains)',
      'Avoid excessive plant density to improve canopy airflow',
      'Manage crop residue by tillage or rotation',
    ],
  ),

  'Corn_(maize)___Common_rust_': DiseaseInfo(
    displayName: 'Corn Common Rust',
    plant: 'Corn (Maize)',
    condition: 'Common Rust',
    isHealthy: false,
    severity: 'medium',
    description:
        'Common rust is caused by Puccinia sorghi. It spreads via windborne spores and typically appears after pollination. Cool, moist conditions favor its development.',
    symptoms: [
      'Oval to elongated brick-red pustules on both leaf surfaces',
      'Pustules may turn dark brown/black late in the season',
      'Severe infection causes premature leaf death',
      'Infected plants show overall yellowing',
    ],
    treatments: [
      'Apply fungicides (azoxystrobin, propiconazole) at first pustule appearance',
      'Most effective when applied early — by V8 growth stage',
      'Remove heavily infected plant material',
    ],
    prevention: [
      'Plant rust-resistant hybrids — the most cost-effective control',
      'Avoid planting near fields with heavy rust history',
      'Scout fields regularly from V6 stage onward',
      'Balanced nutrition — avoid excess nitrogen',
    ],
  ),

  'Corn_(maize)___Northern_Leaf_Blight': DiseaseInfo(
    displayName: 'Northern Leaf Blight',
    plant: 'Corn (Maize)',
    condition: 'Northern Leaf Blight',
    isHealthy: false,
    severity: 'high',
    description:
        'Northern leaf blight (NLB), caused by Exserohilum turcicum, is a serious foliar disease of corn. Yield losses of 30–50% can occur in susceptible hybrids during wet seasons.',
    symptoms: [
      'Cigar-shaped, grayish-green to tan lesions 2.5–15 cm long',
      'Lesions appear first on lower leaves, moving upward',
      'Dark spore masses visible in lesion centers under humid conditions',
      'Entire leaf blighting in severe cases',
    ],
    treatments: [
      'Fungicide applications (azoxystrobin, tebuconazole) at early symptom stage',
      'Most effective when applied at or before tasseling',
      'Incorporate infected crop residue by plowing',
    ],
    prevention: [
      'Plant NLB-resistant hybrids (look for Ht gene resistance)',
      'Rotate crops with non-host species',
      'Manage crop debris with deep tillage',
      'Avoid dense planting to improve air movement',
    ],
  ),

  'Corn_(maize)___healthy': DiseaseInfo(
    displayName: 'Healthy Corn',
    plant: 'Corn (Maize)',
    condition: 'Healthy',
    isHealthy: true,
    severity: 'low',
    description:
        'Your corn plant looks healthy and vigorous. Maintain current practices for a strong harvest.',
    symptoms: [],
    treatments: [],
    prevention: [
      'Rotate crops annually to prevent soil-borne disease buildup',
      'Apply balanced fertilizer based on soil test recommendations',
      'Scout fields weekly for signs of pests and disease',
      'Maintain adequate plant spacing for air circulation',
      'Use certified disease-free seed',
    ],
  ),

  // ─── GRAPE ───────────────────────────────────────────────────────────────────
  'Grape___Black_rot': DiseaseInfo(
    displayName: 'Grape Black Rot',
    plant: 'Grape',
    condition: 'Black Rot',
    isHealthy: false,
    severity: 'high',
    description:
        'Black rot, caused by Guignardia bidwellii, can destroy entire grape crops. It affects leaves, shoots, and fruit, thriving during warm, wet weather.',
    symptoms: [
      'Small, tan circular spots with dark borders on leaves',
      'Black mummified berries ("raisins") remaining on cluster',
      'Dark brown to black lesions on young shoots and tendrils',
      'Infected berries shrivel and turn hard and black',
    ],
    treatments: [
      'Apply mancozeb, myclobutanil, or captan fungicides beginning at bud break',
      'Spray every 7–10 days during bloom and fruit development',
      'Remove and destroy all mummified berries and infected shoots',
      'Improve air circulation through canopy management',
    ],
    prevention: [
      'Remove mummies before dormant pruning each year',
      'Train vines to improve airflow through the canopy',
      'Apply dormant copper spray before bud break',
      'Plant in well-drained sites with good air movement',
    ],
  ),

  'Grape___Esca_(Black_Measles)': DiseaseInfo(
    displayName: 'Grape Esca (Black Measles)',
    plant: 'Grape',
    condition: 'Esca / Black Measles',
    isHealthy: false,
    severity: 'high',
    description:
        'Esca (Black Measles) is a complex wood disease of grapevines caused by multiple fungal pathogens. It can cause sudden vine death and is difficult to manage once established.',
    symptoms: [
      'Tiger-stripe pattern on leaves (yellow/red stripes between veins)',
      'Small dark spots on berries giving a measles appearance',
      'Wood decay in cross-section shows dark necrotic streaking',
      'Sudden wilting and death of shoots or entire vines in acute form',
    ],
    treatments: [
      'No effective curative chemical treatment available',
      'Remove and destroy infected wood during dormant pruning',
      'Paint pruning wounds with fungicidal sealant immediately after cutting',
      'Remove severely affected vines to prevent spread',
    ],
    prevention: [
      'Minimize large pruning wounds; prune during dry weather',
      'Apply wound protectants (Trichoderma-based products) after pruning',
      'Use sharp, clean pruning tools — disinfect between vines',
      'Plant certified disease-free nursery stock',
      'Avoid water stress which weakens vine resistance',
    ],
  ),

  'Grape___Leaf_blight_(Isariopsis_Leaf_Spot)': DiseaseInfo(
    displayName: 'Grape Leaf Blight',
    plant: 'Grape',
    condition: 'Leaf Blight (Isariopsis Leaf Spot)',
    isHealthy: false,
    severity: 'medium',
    description:
        'Grape leaf blight (Isariopsis leaf spot) is caused by Pseudocercospora vitis. It causes premature defoliation, weakening the vine and reducing fruit quality.',
    symptoms: [
      'Irregularly shaped brown spots on upper leaf surface',
      'Dark gray sporulation on the underside of lesions',
      'Premature yellowing and leaf drop',
      'Weakened vines with reduced fruit development',
    ],
    treatments: [
      'Apply copper-based or mancozeb fungicides at first sign',
      'Maintain spray program through the growing season in high-pressure years',
      'Remove fallen leaves to reduce overwintering inoculum',
    ],
    prevention: [
      'Prune for an open canopy to reduce leaf wetness duration',
      'Avoid overhead irrigation',
      'Apply preventive fungicide sprays during wet periods',
      'Keep vineyard floor clean of debris',
    ],
  ),

  'Grape___healthy': DiseaseInfo(
    displayName: 'Healthy Grape',
    plant: 'Grape',
    condition: 'Healthy',
    isHealthy: true,
    severity: 'low',
    description: 'Your grapevine looks healthy. Excellent vine management!',
    symptoms: [],
    treatments: [],
    prevention: [
      'Train vines to maximize canopy airflow and sun exposure',
      'Scout weekly for powdery mildew, downy mildew, and botrytis',
      'Apply preventive copper or sulfur sprays early in the season',
      'Remove suckers and lateral shoots to focus energy on fruit',
      'Test and amend soil pH annually (target 5.5–6.5)',
    ],
  ),

  // ─── ORANGE ──────────────────────────────────────────────────────────────────
  'Orange___Haunglongbing_(Citrus_greening)': DiseaseInfo(
    displayName: 'Citrus Greening (HLB)',
    plant: 'Orange',
    condition: 'Huanglongbing (Citrus Greening)',
    isHealthy: false,
    severity: 'high',
    description:
        'Huanglongbing (HLB), or citrus greening, is the most devastating citrus disease worldwide. Caused by the bacterium Candidatus Liberibacter asiaticus and spread by the Asian citrus psyllid, it has no cure.',
    symptoms: [
      'Asymmetric yellowing of leaves (blotchy mottle pattern)',
      'Small, lopsided, bitter fruit with green tips',
      'Twig dieback and overall tree decline',
      'Bitter, unsaleable fruit with aborted seeds',
    ],
    treatments: [
      'No cure exists — infected trees must eventually be removed',
      'Apply thermotherapy or nutrient injections to temporarily suppress symptoms',
      'Control Asian citrus psyllid vectors with systemic insecticides (imidacloprid)',
      'Remove and destroy infected trees promptly to prevent spread',
    ],
    prevention: [
      'Source nursery trees from certified HLB-free stock only',
      'Control Asian citrus psyllid with regular insecticide applications',
      'Inspect trees monthly for psyllid infestations and early symptoms',
      'Report suspected cases to agricultural authorities immediately',
      'Do not move plant material from affected areas',
    ],
  ),

  // ─── PEACH ───────────────────────────────────────────────────────────────────
  'Peach___Bacterial_spot': DiseaseInfo(
    displayName: 'Peach Bacterial Spot',
    plant: 'Peach',
    condition: 'Bacterial Spot',
    isHealthy: false,
    severity: 'high',
    description:
        'Bacterial spot of peach is caused by Xanthomonas arboricola pv. pruni. It is one of the most serious diseases of peach and nectarine, causing defoliation and fruit blemishes.',
    symptoms: [
      'Small, water-soaked spots on leaves that turn dark brown with yellow halos',
      'Shothole appearance as infected tissue falls out',
      'Sunken, dark lesions on fruit surface',
      'Severe defoliation in wet years leading to weakened trees',
    ],
    treatments: [
      'Apply copper bactericides starting at shuck split stage',
      'Oxytetracycline sprays during bloom can reduce spread',
      'Prune out infected twigs during dry weather',
      'Avoid wounding trees during cultivation',
    ],
    prevention: [
      'Plant resistant varieties (e.g., Contender, Redhaven)',
      'Avoid overhead irrigation; use drip systems',
      'Prune to improve air circulation and light penetration',
      'Apply dormant copper spray before budbreak',
    ],
  ),

  'Peach___healthy': DiseaseInfo(
    displayName: 'Healthy Peach',
    plant: 'Peach',
    condition: 'Healthy',
    isHealthy: true,
    severity: 'low',
    description: 'Your peach tree is looking healthy. Keep up the great care!',
    symptoms: [],
    treatments: [],
    prevention: [
      'Apply a dormant copper spray each year before bud break',
      'Prune annually to open the canopy and remove dead wood',
      'Thin fruit to one per 15–20 cm of branch to improve quality',
      'Monitor for peach leaf curl, bacterial spot, and brown rot',
      'Fertilize in early spring with a balanced fertilizer',
    ],
  ),

  // ─── PEPPER ──────────────────────────────────────────────────────────────────
  'Pepper,_bell___Bacterial_spot': DiseaseInfo(
    displayName: 'Bell Pepper Bacterial Spot',
    plant: 'Bell Pepper',
    condition: 'Bacterial Spot',
    isHealthy: false,
    severity: 'high',
    description:
        'Bacterial spot on bell pepper is caused by Xanthomonas campestris pv. vesicatoria. It is particularly damaging in warm, wet weather and causes severe yield losses.',
    symptoms: [
      'Small, water-soaked spots on leaves, later turning brown with yellow halos',
      'Raised, scab-like lesions on fruit',
      'Premature fruit drop and defoliation',
      'Spots may merge causing large necrotic areas',
    ],
    treatments: [
      'Apply copper bactericides + mancozeb as a tank mix',
      'Spray preventively every 5–7 days during warm wet periods',
      'Remove and destroy heavily infected plants',
      'Avoid working in the field when plants are wet',
    ],
    prevention: [
      'Use certified disease-free seed or hot-water treated seed',
      'Practice 2–3 year crop rotation away from solanaceous crops',
      'Avoid overhead irrigation',
      'Plant resistant varieties when available',
      'Eliminate weed hosts around the field',
    ],
  ),

  'Pepper,_bell___healthy': DiseaseInfo(
    displayName: 'Healthy Bell Pepper',
    plant: 'Bell Pepper',
    condition: 'Healthy',
    isHealthy: true,
    severity: 'low',
    description:
        'Your bell pepper plant is thriving! Maintain these conditions for a productive crop.',
    symptoms: [],
    treatments: [],
    prevention: [
      'Water at the soil level to keep foliage dry',
      'Use plastic mulch to reduce soil splash and conserve moisture',
      'Stake plants to prevent fruit contact with soil',
      'Rotate crops every 2–3 years',
      'Inspect weekly for aphids, thrips, and early disease signs',
    ],
  ),

  // ─── POTATO ──────────────────────────────────────────────────────────────────
  'Potato___Early_blight': DiseaseInfo(
    displayName: 'Potato Early Blight',
    plant: 'Potato',
    condition: 'Early Blight',
    isHealthy: false,
    severity: 'medium',
    description:
        'Early blight is caused by Alternaria solani. It primarily affects older or stressed plants and causes significant defoliation that reduces tuber yield.',
    symptoms: [
      'Dark brown circular spots with concentric rings (target-board pattern)',
      'Yellow halo surrounding lesions',
      'Lesions appear first on older, lower leaves',
      'Severe leaf yellowing and premature defoliation',
    ],
    treatments: [
      'Apply fungicides (chlorothalonil, mancozeb, azoxystrobin) at first sign',
      'Spray every 7–10 days during favorable conditions',
      'Remove and destroy infected plant tissue',
      'Ensure adequate nutrition — stressed plants are more susceptible',
    ],
    prevention: [
      'Use certified disease-free seed potatoes',
      'Rotate crops on a 3-year cycle',
      'Maintain adequate soil fertility, especially potassium',
      'Avoid overhead irrigation; water in the morning',
      'Destroy volunteer potato plants and weed hosts',
    ],
  ),

  'Potato___Late_blight': DiseaseInfo(
    displayName: 'Potato Late Blight',
    plant: 'Potato',
    condition: 'Late Blight',
    isHealthy: false,
    severity: 'high',
    description:
        'Late blight, caused by Phytophthora infestans, is the most devastating potato disease historically (responsible for the Irish Famine). It can destroy entire fields within days under favorable conditions.',
    symptoms: [
      'Water-soaked, pale green to dark brown/black lesions on leaves',
      'White fluffy sporulation on lesion undersides in humid conditions',
      'Firm, brown to purple rotting of tubers',
      'Rapid collapse and death of entire plants',
    ],
    treatments: [
      'Apply specific fungicides (metalaxyl, cymoxanil, chlorothalonil) immediately',
      'Use systemic fungicides for active infections; contact fungicides for prevention',
      'Spray every 5–7 days during wet, cool weather',
      'Destroy all infected plant material — do not compost',
    ],
    prevention: [
      'Plant certified, disease-free seed tubers',
      'Choose resistant varieties (e.g., Sarpo Mira, Defender)',
      'Apply preventive fungicides during high-risk weather (cool + wet)',
      'Hill soil up around plants to protect tubers',
      'Destroy all volunteer plants and cull piles',
      'Monitor using late blight forecasting systems (e.g., BlightWatch)',
    ],
  ),

  'Potato___healthy': DiseaseInfo(
    displayName: 'Healthy Potato',
    plant: 'Potato',
    condition: 'Healthy',
    isHealthy: true,
    severity: 'low',
    description:
        'Your potato plant appears healthy. Good growing conditions are in place.',
    symptoms: [],
    treatments: [],
    prevention: [
      'Use only certified seed potatoes each season',
      'Hill plants twice during the growing season',
      'Monitor closely for late blight during cool, wet periods',
      'Rotate with non-Solanaceous crops for at least 3 years',
      'Harvest promptly when mature to avoid tuber diseases',
    ],
  ),

  // ─── RASPBERRY ───────────────────────────────────────────────────────────────
  'Raspberry___healthy': DiseaseInfo(
    displayName: 'Healthy Raspberry',
    plant: 'Raspberry',
    condition: 'Healthy',
    isHealthy: true,
    severity: 'low',
    description:
        'Your raspberry plant is healthy and productive. Continue with good cultural practices.',
    symptoms: [],
    treatments: [],
    prevention: [
      'Remove old floricanes after harvest to prevent disease carryover',
      'Tie canes to supports to improve air circulation',
      'Avoid waterlogged soils — plant in well-drained beds',
      'Scout for raspberry cane blight and anthracnose regularly',
      'Mulch around base to conserve moisture and suppress weeds',
    ],
  ),

  // ─── SOYBEAN ─────────────────────────────────────────────────────────────────
  'Soybean___healthy': DiseaseInfo(
    displayName: 'Healthy Soybean',
    plant: 'Soybean',
    condition: 'Healthy',
    isHealthy: true,
    severity: 'low',
    description:
        'Your soybean plant is healthy and growing well. Maintain current management.',
    symptoms: [],
    treatments: [],
    prevention: [
      'Rotate with non-legume crops to prevent SCN and soil-borne diseases',
      'Use seed treated with fungicide and insecticide',
      'Scout for soybean rust, sudden death syndrome, and aphids',
      'Avoid compaction by limiting field traffic when soil is wet',
      'Inoculate seed with Bradyrhizobium japonicum for optimal nitrogen fixation',
    ],
  ),

  // ─── SQUASH ──────────────────────────────────────────────────────────────────
  'Squash___Powdery_mildew': DiseaseInfo(
    displayName: 'Squash Powdery Mildew',
    plant: 'Squash',
    condition: 'Powdery Mildew',
    isHealthy: false,
    severity: 'medium',
    description:
        'Powdery mildew on squash is caused by Podosphaera xanthii (syn. Sphaerotheca fuliginea). It spreads rapidly in warm, dry weather and can prematurely age the plant.',
    symptoms: [
      'White powdery patches on upper and lower leaf surfaces',
      'Yellowing and browning of affected leaves',
      'Premature leaf drop reducing photosynthesis',
      'Stunted fruit development in severe cases',
    ],
    treatments: [
      'Apply potassium bicarbonate, sulfur, or neem oil at first sign',
      'Use systemic fungicides (myclobutanil, trifloxystrobin) for severe infections',
      'Remove and destroy heavily infected leaves',
      'Spray both sides of leaves for full coverage',
    ],
    prevention: [
      'Plant resistant varieties (e.g., Dunja, Astia)',
      'Provide adequate spacing for air circulation',
      'Avoid excess nitrogen fertilization',
      'Apply neem oil or baking soda solution preventively',
      'Water at the base, not overhead',
    ],
  ),

  // ─── STRAWBERRY ──────────────────────────────────────────────────────────────
  'Strawberry___Leaf_scorch': DiseaseInfo(
    displayName: 'Strawberry Leaf Scorch',
    plant: 'Strawberry',
    condition: 'Leaf Scorch',
    isHealthy: false,
    severity: 'medium',
    description:
        'Leaf scorch in strawberry is caused by the fungus Diplocarpon earlianum. It is one of the most common foliage diseases of strawberry, reducing plant vigor and yield.',
    symptoms: [
      'Irregular dark purple to red spots on upper leaf surface',
      'Spots lack distinct margins (unlike leaf spot disease)',
      'Leaves appear scorched or burned in severe cases',
      'Premature defoliation weakening the plant',
    ],
    treatments: [
      'Apply captan or myclobutanil fungicides starting in early spring',
      'Spray every 10–14 days during wet weather',
      'Remove old leaves after renovation or harvest',
      'Improve air circulation through proper plant spacing',
    ],
    prevention: [
      'Remove and destroy infected leaves at renovation',
      'Renovate beds promptly after harvest (mow, till row edges)',
      'Use drip irrigation to keep foliage dry',
      'Plant in well-drained sites',
      'Replace beds every 3–4 years',
    ],
  ),

  'Strawberry___healthy': DiseaseInfo(
    displayName: 'Healthy Strawberry',
    plant: 'Strawberry',
    condition: 'Healthy',
    isHealthy: true,
    severity: 'low',
    description:
        'Your strawberry plant looks healthy. Wonderful work maintaining this crop!',
    symptoms: [],
    treatments: [],
    prevention: [
      'Renovate beds annually after fruiting to remove old foliage',
      'Use plastic mulch or straw to keep fruit off the soil',
      'Scout for gray mold (Botrytis) during fruit development',
      'Replace planting stock every 3–4 years',
      'Water early in the day to allow foliage to dry before evening',
    ],
  ),

  // ─── TOMATO ──────────────────────────────────────────────────────────────────
  'Tomato___Bacterial_spot': DiseaseInfo(
    displayName: 'Tomato Bacterial Spot',
    plant: 'Tomato',
    condition: 'Bacterial Spot',
    isHealthy: false,
    severity: 'high',
    description:
        'Bacterial spot on tomato is caused by Xanthomonas species. It is a serious disease in warm, rainy climates that affects leaves, stems, and fruit.',
    symptoms: [
      'Small, water-soaked spots on leaves becoming brown with yellow halos',
      'Raised, scab-like dark lesions on green fruit',
      'Defoliation exposing fruit to sunscald',
      'Cankers on stems in severe cases',
    ],
    treatments: [
      'Apply copper-based bactericides + mancozeb tank mix',
      'Spray on a 5–7 day schedule during warm, wet weather',
      'Remove heavily infected plant parts',
      'Do not work in field when foliage is wet',
    ],
    prevention: [
      'Use certified disease-free seed or hot-water treatment (50°C for 25 min)',
      'Rotate fields away from solanaceous crops for 2–3 years',
      'Use drip irrigation instead of overhead systems',
      'Stake and prune for good canopy airflow',
    ],
  ),

  'Tomato___Early_blight': DiseaseInfo(
    displayName: 'Tomato Early Blight',
    plant: 'Tomato',
    condition: 'Early Blight',
    isHealthy: false,
    severity: 'medium',
    description:
        'Early blight on tomato is caused by Alternaria solani. Though named "early," it commonly affects stressed or older plants mid-to-late season.',
    symptoms: [
      'Concentric ring (bullseye) dark brown lesions on lower leaves first',
      'Yellow halo around lesions',
      'Stem collar lesions in young plants (damping-off)',
      'Dark, leathery sunken lesions on fruit near stem end',
    ],
    treatments: [
      'Apply chlorothalonil, mancozeb, or azoxystrobin at first sign',
      'Spray every 7–10 days; more frequently in wet weather',
      'Remove lower infected leaves to slow spread',
      'Ensure adequate plant nutrition to reduce stress susceptibility',
    ],
    prevention: [
      'Mulch around plants to prevent soil splash',
      'Rotate crops with non-solanaceous species',
      'Water at soil level using drip systems',
      'Ensure adequate spacing for airflow',
      'Use disease-free or resistant transplants',
    ],
  ),

  'Tomato___Late_blight': DiseaseInfo(
    displayName: 'Tomato Late Blight',
    plant: 'Tomato',
    condition: 'Late Blight',
    isHealthy: false,
    severity: 'high',
    description:
        'Tomato late blight, caused by Phytophthora infestans, is highly destructive. It can wipe out crops within days under cool, wet conditions and spreads rapidly through airborne spores.',
    symptoms: [
      'Large, irregular water-soaked dark green to brown lesions on leaves',
      'White mold on underside of lesions in humid conditions',
      'Dark brown, firm rot on green fruit',
      'Rapid plant collapse under sustained wet weather',
    ],
    treatments: [
      'Apply fungicides (chlorothalonil, mancozeb, cymoxanil) immediately',
      'Use Ridomil (metalaxyl) for systemic control in active infections',
      'Remove and bag all infected plant material — do not compost',
      'Spray every 5–7 days during cool, wet weather',
    ],
    prevention: [
      'Monitor weather forecasts — spray before rain events',
      'Use resistant varieties (Iron Lady, Defiant, Mountain Magic)',
      'Avoid overhead irrigation',
      'Scout fields twice weekly during high-risk periods',
      'Destroy all volunteer tomato and potato plants nearby',
    ],
  ),

  'Tomato___Leaf_Mold': DiseaseInfo(
    displayName: 'Tomato Leaf Mold',
    plant: 'Tomato',
    condition: 'Leaf Mold',
    isHealthy: false,
    severity: 'medium',
    description:
        'Leaf mold is caused by Passalora fulva (syn. Cladosporium fulvum). It is most problematic in greenhouse tomatoes or humid environments, affecting foliage and reducing yield.',
    symptoms: [
      'Pale yellow spots on upper leaf surface',
      'Olive-green to brown velvety mold on leaf underside',
      'Older leaves dry out and drop prematurely',
      'Rarely affects fruit directly',
    ],
    treatments: [
      'Apply fungicides (chlorothalonil, mancozeb, copper) at first sign',
      'In greenhouses: improve ventilation to reduce humidity below 85%',
      'Remove and destroy infected leaves',
      'Avoid wetting foliage when irrigating',
    ],
    prevention: [
      'Plant resistant varieties (most modern hybrids have Cf gene resistance)',
      'Maintain greenhouse RH below 85%',
      'Prune lower leaves to improve airflow',
      'Use drip irrigation and avoid overhead watering',
    ],
  ),

  'Tomato___Septoria_leaf_spot': DiseaseInfo(
    displayName: 'Tomato Septoria Leaf Spot',
    plant: 'Tomato',
    condition: 'Septoria Leaf Spot',
    isHealthy: false,
    severity: 'medium',
    description:
        'Septoria leaf spot, caused by Septoria lycopersici, is one of the most common tomato foliage diseases. It causes early defoliation, exposing fruit to sunscald.',
    symptoms: [
      'Many small circular spots (3–5 mm) with dark margins and lighter centers',
      'Tiny black dots (pycnidia) visible in center of spots',
      'Lesions appear first on lower, older leaves',
      'Rapid defoliation from the bottom of the plant upward',
    ],
    treatments: [
      'Apply chlorothalonil, mancozeb, or copper fungicides',
      'Begin sprays when first symptoms appear; repeat every 7–10 days',
      'Remove infected lower leaves to slow upward spread',
    ],
    prevention: [
      'Mulch around base to prevent soil splash',
      'Stake plants for good air circulation',
      'Rotate crops — pathogen survives on solanaceous debris',
      'Water at soil level; avoid wetting foliage',
      'Use disease-free transplants',
    ],
  ),

  'Tomato___Spider_mites Two-spotted_spider_mite': DiseaseInfo(
    displayName: 'Tomato Spider Mites',
    plant: 'Tomato',
    condition: 'Two-Spotted Spider Mite',
    isHealthy: false,
    severity: 'medium',
    description:
        'Two-spotted spider mites (Tetranychus urticae) are not a disease but a serious pest. They thrive in hot, dry conditions and rapidly reproduce, causing significant plant damage.',
    symptoms: [
      'Fine yellow stippling/speckling on upper leaf surface',
      'Fine silk webbing on underside of leaves and stems',
      'Leaves turn bronzed, then brown and dry in severe infestations',
      'Tiny moving dots visible on leaf undersides with magnification',
    ],
    treatments: [
      'Apply acaricides (abamectin, bifenazate, spiromesifen)',
      'Insecticidal soap or neem oil sprays targeting leaf undersides',
      'Release predatory mites (Phytoseiulus persimilis) for biological control',
      'Strong water sprays to knock mites off plants',
    ],
    prevention: [
      'Avoid excessive nitrogen fertilization which promotes outbreaks',
      'Maintain adequate irrigation to prevent plant water stress',
      'Monitor weekly by checking leaf undersides',
      'Avoid broad-spectrum insecticide use which kills natural enemies',
      'Introduce predatory mites early in the season',
    ],
  ),

  'Tomato___Target_Spot': DiseaseInfo(
    displayName: 'Tomato Target Spot',
    plant: 'Tomato',
    condition: 'Target Spot',
    isHealthy: false,
    severity: 'medium',
    description:
        'Target spot is caused by Corynespora cassiicola. It can affect all above-ground parts of the tomato plant and is increasingly reported in tropical and subtropical regions.',
    symptoms: [
      'Circular to irregular brown lesions with concentric rings on leaves',
      'Dark brown lesions with light brown centers on fruit',
      'Premature defoliation in severe cases',
      'Spots also appear on stems and petioles',
    ],
    treatments: [
      'Apply azoxystrobin, chlorothalonil, or mancozeb fungicides',
      'Begin sprays at early symptom stage; repeat every 7–14 days',
      'Remove infected plant material from field',
    ],
    prevention: [
      'Avoid overhead irrigation',
      'Maintain good plant spacing for air movement',
      'Rotate crops with non-host species',
      'Stake and prune for open canopy',
    ],
  ),

  'Tomato___Tomato_Yellow_Leaf_Curl_Virus': DiseaseInfo(
    displayName: 'Tomato Yellow Leaf Curl Virus',
    plant: 'Tomato',
    condition: 'Yellow Leaf Curl Virus (TYLCV)',
    isHealthy: false,
    severity: 'high',
    description:
        'TYLCV is a devastating viral disease transmitted by the silverleaf whitefly (Bemisia tabaci). It causes severe yield losses and infected plants rarely recover.',
    symptoms: [
      'Upward curling and yellowing of leaves (especially new growth)',
      'Stunted plant growth',
      'Small, chlorotic leaves with purple veination',
      'Severe reduction or complete loss of fruit set',
    ],
    treatments: [
      'No cure exists for virus-infected plants — remove and destroy them',
      'Control whitefly vectors immediately with imidacloprid or spirotetramat',
      'Use yellow sticky traps to monitor whitefly populations',
      'Remove infected plants promptly to protect neighboring plants',
    ],
    prevention: [
      'Plant TYLCV-resistant varieties (most modern hybrids carry Ty genes)',
      'Use insect-proof netting in nurseries',
      'Apply systemic insecticides at transplanting for early whitefly control',
      'Avoid planting near old or abandoned tomato/pepper fields',
      'Use reflective mulches to repel whiteflies',
    ],
  ),

  'Tomato___Tomato_mosaic_virus': DiseaseInfo(
    displayName: 'Tomato Mosaic Virus',
    plant: 'Tomato',
    condition: 'Tomato Mosaic Virus (ToMV)',
    isHealthy: false,
    severity: 'high',
    description:
        'Tomato mosaic virus (ToMV) is a highly contagious virus spread primarily through contaminated tools, hands, and seed. It can persist in soil and plant debris for years.',
    symptoms: [
      'Mosaic or mottled pattern of light and dark green on leaves',
      'Leaf distortion, blistering, or fern-leaf symptoms',
      'Stunted plant growth',
      'Reduced fruit set with internal browning of fruit',
    ],
    treatments: [
      'No cure — infected plants should be removed and destroyed',
      'Disinfect all tools with 10% bleach or 70% alcohol solution',
      'Wash hands thoroughly after handling infected plants',
      'Do not smoke near plants (tobacco can carry related viruses)',
    ],
    prevention: [
      'Use certified virus-free seed or seed treated with 10% trisodium phosphate',
      'Plant ToMV-resistant varieties (Tm genes)',
      'Disinfect tools between plants',
      'Wash hands before entering the crop',
      'Remove and destroy infected plants promptly',
      'Avoid growing tomatoes in soil with known virus history',
    ],
  ),

  'Tomato___healthy': DiseaseInfo(
    displayName: 'Healthy Tomato',
    plant: 'Tomato',
    condition: 'Healthy',
    isHealthy: true,
    severity: 'low',
    description:
        'Your tomato plant is in great health! Continue with your current management practices.',
    symptoms: [],
    treatments: [],
    prevention: [
      'Stake or cage plants for support and improved air circulation',
      'Water consistently at soil level to prevent blossom end rot',
      'Apply calcium spray if blossom end rot appears',
      'Scout weekly for early blight, late blight, and whiteflies',
      'Rotate tomatoes to a new bed each year',
      'Mulch around base to conserve moisture and prevent soil splash',
    ],
  ),
};
