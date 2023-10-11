import json
import glob

for setting in [
    'codellama7b_minif2f_test',
    'codellama34b_minif2f_test',
    'llemma7b_minif2f_test',
    'llemma34b_minif2f_test'
]:
    fs = [json.load(open(x)) for x in glob.glob('./output/%s/*.json' % setting)]
    n = 0
    ns = 0
    for f in fs:
        for result in f['results']:
            name = result['example']['full_name']

            # Extra helper theorem in the OpenAI code
            if 'sum_pairs' in name:
                continue

            n += 1
            if result['success']:
                ns += 1

    print(setting, ns/n, ns, n, sep='\t')

