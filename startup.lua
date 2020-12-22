fs.delete("worker")
fs.copy("disk/worker", "worker")
shell.run("worker")