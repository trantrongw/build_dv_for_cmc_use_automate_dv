
from flask import Flask, jsonify
import subprocess


app = Flask(__name__)

@app.route('/rundbt', methods=['GET'])
def run_dbt():
    try:
        # Run dbt command using subprocess
        result = subprocess.run("dbt build --profiles-dir profiles", shell=True)

        if result.returncode == 0:
            return jsonify({'success': True, 'message': 'dbt run completed successfully'})
        else:
            return jsonify({'success': False, 'message': 'dbt run failed', 'output': result.stderr})
    except FileNotFoundError:
        return jsonify({'success': False, 'message': 'dbt command not found'})
    
if __name__ == '__main__':
    app.run(host="0.0.0.0", port=80)