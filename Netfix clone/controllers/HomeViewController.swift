//
//  HomeViewController.swift
//  Netfix clone
//
//  Created by Soham.C.Athawale on 02/10/22.
//

import UIKit

enum sections: Int{
    case trendingmovies = 0
    case trendingtv = 1
    case popular = 2
    case upcoming = 3
    case toprated = 4
}


class HomeViewController: UIViewController {
    
    let sectiontitle: [String] = [ "Trending Movies" , "Trending Tv" , "Popular" , "Upcomining Titles","Top Rated" ]
    
    
    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style:.grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier:CollectionViewTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(homeFeedTable)
        view.backgroundColor =  .systemBackground
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        configurenavbar()
        let headerview = HeaderUIView(frame:CGRect(x: 0, y: 0, width: view.bounds.width, height: 550))
        homeFeedTable.tableHeaderView = headerview
        
    }
    private func configurenavbar() {
        var image  = UIImage(named:"logo1")
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
        navigationController?.navigationBar.tintColor  = .cyan
    }
        
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
        
    }
}


extension HomeViewController: UITableViewDelegate , UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectiontitle.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:CollectionViewTableViewCell.identifier,for:indexPath)as?CollectionViewTableViewCell else{
         return UITableViewCell()
        }
        switch indexPath.section{
        case sections.trendingmovies.rawValue:
            APICaller.shared.getTrendingmovie{results in
                switch results{
                case.success(let titles):
                    cell.configure(with: titles)
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
        case sections.trendingtv.rawValue:
            APICaller.shared.getTrendingtv{results in
                switch results{
                case.success(let titles):
                    cell.configure(with: titles)
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
        case sections.popular.rawValue:
            APICaller.shared.getpopular{results in
                switch results{
                case.success(let titles):
                    cell.configure(with: titles)
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
        case sections.upcoming.rawValue:
            APICaller.shared.getUpcoming{results in
                switch results{
                case.success(let titles):
                    cell.configure(with: titles)
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
        case sections.toprated.rawValue:
            APICaller.shared.getToprated{results in
                switch results{
                case.success(let titles):
                    cell.configure(with: titles)
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
        default:
            return UITableViewCell()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectiontitle[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else{return}
        header.textLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x+20, y:header.bounds.origin.y , width: 100,height: header.bounds.height)
        header.textLabel?.text = header.textLabel?.text?.capitalizefirstletter()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultoffset = view.safeAreaInsets.top
        let offset  = scrollView.contentOffset.y + defaultoffset
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0,-offset))
    }
    
    
    
    
    
    
}





