import json
import numpy as np
import matplotlib.pyplot as plt

with open("/run/media/solom/Abdo/Abdo/Abdo's University work/spring 2020/Research/code/riscv code/riscv_sample.s", "rt") as in_file:
    in_data = in_file.read().split()
    with open("/run/media/solom/Abdo/Abdo/Abdo's University work/spring 2020/Research/insts.json", "r") as in_json :
        res = dict()
        json_data = json.load(in_json)
        for i in json_data['instructions']:
            for j in i["insts"]:
                res[j.lower()] = in_data.count(j.lower())

out = res
for k, v in res.copy().items():
    if v == 0:
        del out[k]

plt.bar(list(res.keys()), list(res.values()))
print("used " + str(len(out)/len(res)) + "% of instructions")
plt.show()
