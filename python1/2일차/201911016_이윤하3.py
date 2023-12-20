from wordcloud import WordCloud
import matplotlib.pyplot as plt
from collections import Counter

# 100개의 중복 키워드
keywords = [
    "translation", "artificial intelligence", "language processing", "machine translation", "natural language understanding",
    "neural machine translation", "linguistics", "translation service", "text analysis", "multilingual",
    "automatic translation", "language technology", "language model", "transcription", "linguistic data",
    "computational linguistics", "semantic analysis", "linguistic processing", "language translation", "translation tool",
    "language services", "translation platform", "parallel corpora", "bilingual", "language pair",
    "speech recognition", "voice translation", "language understanding", "machine learning", "deep learning",
    "transliteration", "syntax analysis", "semantic parsing", "cognitive computing", "language understanding",
    "translation memory", "contextual translation", "artificial neural network", "language generation", "language understanding",
    "cross-language", "translation quality", "machine translation system", "language processing model", "translation accuracy",
    "language comprehension", "translation algorithm", "language synthesis", "neural translation", "translation efficiency",
    "language understanding model", "translation evaluation", "artificial intelligence translation", "translation technology", "computational language",
    "multilingual translation", "language translation service", "translation innovation", "machine translation model", "language translation tool",
    "neural network translation", "linguistic analysis", "translation automation", "language translation platform", "machine translation accuracy",
    "language translation system", "translation model", "language translation accuracy", "neural translation model", "language processing technology",
    "automatic translation system", "language translation algorithm", "translation efficiency", "neural language translation", "machine translation efficiency",
    "language understanding technology", "translation memory system", "artificial intelligence language translation", "translation model accuracy", "neural machine translation system",
    "language translation evaluation", "machine translation algorithm", "language translation innovation", "translation memory technology", "neural machine translation model",
    "language translation automation", "translation tool efficiency", "machine translation technology", "language understanding algorithm", "neural translation efficiency",
    "language translation efficiency", "translation quality evaluation", "machine translation efficiency", "language translation quality", "neural translation technology",
    "language understanding efficiency", "translation memory efficiency", "artificial intelligence translation system", "translation tool accuracy", "machine translation evaluation",
    "language translation model accuracy", "neural machine translation efficiency", "language understanding model accuracy", "translation memory accuracy", "artificial intelligence translation accuracy"
]

# 단어 빈도 계산
word_counts = Counter(keywords)

# 워드 클라우드 생성 및 표시
wordcloud = WordCloud(width=800, height=400, background_color='white').generate_from_frequencies(word_counts)

plt.figure(figsize=(10, 5))
plt.imshow(wordcloud, interpolation='bilinear')
plt.axis('off')
plt.show()