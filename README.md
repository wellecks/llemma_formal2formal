# `llemma` formal2formal 

Scripts for the Lean formal2formal (tactic prediction) experiments in \
[Llemma: an open language model for mathematics  [Azerbayev et al 2023]](https://arxiv.org/abs/2310.10631)

#### Setup
Install Python packages:
```
pip install -r requirements.txt
```

Install Lean:
```
# from https://leanprover-community.github.io/install/linux.html
# After running this command, select (2), then `nightly`, then `y`:
curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf | sh
source $HOME/.elan/env
lake
```

Configure LeanDojo:
```
export CONTAINER="native"
```

#### Run
See `scripts`

#### Compute metrics

```bash
python compute_metrics.py
==>

codellama7b_minif2f_test        0.20491803278688525     50      244
codellama34b_minif2f_test       0.22131147540983606     54      244
llemma7b_minif2f_test   0.26229508196721313     64      244
llemma34b_minif2f_test  0.2581967213114754      63      244
```



### Troubleshooting
- We observe a Ray error when running the 34b script (with VLLM `--tp-degree > 1`) on an untraced LeanDojo repo. A workaround is to run the 7b script with `--tp-degree 1` such that LeanDojo completes tracing the repo. Then run the 34b script with `--tp-degree > 1`.

### Citation
Please cite the following:
```
@misc{azerbayev2023llemma,
      title={Llemma: An Open Language Model For Mathematics}, 
      author={Zhangir Azerbayev and Hailey Schoelkopf and Keiran Paster and Marco Dos Santos and Stephen McAleer and Albert Q. Jiang and Jia Deng and Stella Biderman and Sean Welleck},
      year={2023},
      eprint={2310.10631},
      archivePrefix={arXiv},
      primaryClass={cs.CL}
}
```

