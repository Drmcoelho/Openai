from flask import Flask, request, jsonify
import openai

app = Flask(__name__)

# Initialize OpenAI API
openai.api_key = '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'

@app.route('/', methods=['GET'])
def index():
    return 'Hello, World!'

@app.route('/generate', methods=['POST'])
def generate_text():
    prompt = request.json.get('prompt', '')
    try:
        response = openai.Completion.create(
            engine='text-davinci-002',
            prompt=prompt,
            max_tokens=100
        )
        text = response.choices[0].text.strip()
        return jsonify({'generated_text': text})
    except Exception as e:
        return jsonify({'error': str(e)}), 400

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
