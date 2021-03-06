execute 'add dummy interface eth1' do
  command 'ip link add dev eth1 type dummy'
  not_if 'ip a show dev eth1'
end

execute 'online eth1' do
  command 'ip link set dev eth1 up'
  not_if 'ip a show dev eth1 | grep UP'
end

ifconfig '192.168.9.1' do
  device 'eth1'
end
