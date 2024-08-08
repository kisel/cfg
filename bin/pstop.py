import argparse
import psutil

def top_memory_processes(n=10, propname=None):
    pgrp = {}
    processes = []
    if propname is None:
        propname = 'rss'
    for p in psutil.process_iter():
        try:
            name = p.name()
            if name not in pgrp:
                pgrp[name] = {'mem': 0}

            memory_mb = getattr(p.memory_info(), propname) / (1024 * 1024)
            #print(memory_mb)
            pgrp[name]['mem'] += memory_mb
            processes.append((name, memory_mb))
        except (psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess):
            pass

    processes = [(k, v['mem']) for k,v in pgrp.items()]
    total_mem = sum([p[1] for p in processes])
    #print(processes)
    print(f"Total mem: {total_mem:.2f} MB")

    processes.sort(key=lambda x: x[1], reverse=True)
    for process, memory in processes[:n]:
        print(f"{process}: {memory:.2f} MB")

def get_memory_prop_keys():
    # dummy. current process
    mi = psutil.Process().memory_info()
    return [k for k in dir(mi) if type(getattr(mi, k)) == int]

def main():
    parser = argparse.ArgumentParser(description="Who the hell eat all my RAM?")
    parser.add_argument('-n', type=int, default=10, help='num of process to show')
    parser.add_argument('--propname', '-p', type=str, choices=get_memory_prop_keys(),
                        help='num of process to show')
    args = parser.parse_args()
    top_memory_processes(args.n, propname=args.propname)

if __name__ == "__main__":
    main()
