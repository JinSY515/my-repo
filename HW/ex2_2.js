const fs = require('fs');
const path = require('path');
const util = require('util');

const readDir = util.promisify(fs.readdir);

const DirectorySearch = async dirname =>{
    try{
        const dir_files = await readDir(dirname);
        dir_files.forEach(file =>{
            const curpath = path.join(dirname, file);
            //console.log(curpath);
            fs.stat(curpath, (err, stats)=>{
                //stats 확인, directory인지 file인지 확인. 
                //directory이면 file 더 찾기. file이면 출력.
                if(stats){
                    if(stats.isDirectory()) DirectorySearch(curpath);
                    else{
                        console.log(curpath);
                    }
                }  
            }) //fs.stat(file, callback), callback = (err, stats)

        })
    } catch (err){
        console.log(err);
    }
};

DirectorySearch('./');